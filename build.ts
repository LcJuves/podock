import * as log from "https://deno.land/std@0.142.0/log/mod.ts";
import { join } from "https://deno.land/std@0.142.0/path/mod.ts";
import { parse } from "https://deno.land/std@0.142.0/flags/mod.ts";

const parsedArgs = parse(Deno.args, { "--": false });
// console.dir(parsedArgs);
const currentWorkingDirectory = Deno.cwd();
const buildType = parsedArgs["buildType"] ?? "linux";
let ignoreDirs = [];
const parsedArgIgnoreDirs = parsedArgs["ignoreDirs"];
if (parsedArgIgnoreDirs) {
  ignoreDirs = parsedArgIgnoreDirs.split(",");
}
const push = (parsedArgs["push"] ?? "false") === "true";
// console.dir({ buildType, ignoreDirs, push });

async function buildContainerImage(
  wd: string,
  containerName: string,
  containerTag: string,
) {
  let imageName = `${containerName}:${containerTag}`;
  const envCiRegistryUser = Deno.env.get("CI_REGISTRY_USER") ?? "";
  if (envCiRegistryUser !== "") {
    imageName = `${envCiRegistryUser}/${imageName}`;
  }
  if (buildType === "linux" && containerTag.indexOf("win") !== -1) {
    log.info(`Skip windows' container image ${imageName}`);
    return;
  } else if (buildType === "windows" && containerName.indexOf("win") === -1) {
    log.info(`Skip linux's container image ${imageName}`);
    return;
  }
  log.info(`Starting build image ${imageName} ...`);
  let dockerfileName = `${containerTag}.Dockerfile`;
  try {
    await Deno.stat(join(wd, dockerfileName));
  } catch (_) {
    dockerfileName = "Dockerfile";
  }

  const dockerBuildP = Deno.run({
    cmd: ["docker", "build", "-t", imageName, "-f", dockerfileName, "."],
    cwd: wd,
  });
  const dockerBuildStatus = await dockerBuildP.status();
  if (dockerBuildStatus.code !== 0) {
    log.info(`build image ${imageName} with error!`);
    Deno.exit(dockerBuildStatus.code);
  } else {
    log.info(`build image ${imageName} succeed!`);
  }

  if (push) {
    const dockerPushP = Deno.run({
      cmd: ["docker", "push", imageName],
      cwd: wd,
    });
    const dockerPushStatus = await dockerPushP.status();
    if (dockerPushStatus.code !== 0) {
      log.info(`push image ${imageName} with error!`);
      Deno.exit(dockerPushStatus.code);
    } else {
      log.info(`push image ${imageName} succeed!`);
    }
  }
}

log.info("Starting pre-build ...");
const p = Deno.run({
  cmd: ["bash", "-e", "pre-build.sh"],
  cwd: currentWorkingDirectory,
});
const status = await p.status();
if (status.code !== 0) {
  log.info("Pre-build with error!");
  Deno.exit(status.code);
} else {
  log.info("Pre-build succeed!");
}

rootLoop:
for (const containerDirEntry of Deno.readDirSync(currentWorkingDirectory)) {
  if (
    containerDirEntry.isDirectory && !containerDirEntry.name.startsWith(".")
  ) {
    const containerName = containerDirEntry.name;
    for (const ignoreDir of ignoreDirs) {
      if (ignoreDir === containerName) {
        continue rootLoop;
      }
    }
    const containerWd = join(currentWorkingDirectory, containerName);
    for (
      const containerTagDirEntry of Deno.readDirSync(
        containerWd,
      )
    ) {
      if (
        containerTagDirEntry.isFile &&
        containerTagDirEntry.name.endsWith("Dockerfile")
      ) {
        let containerTag = containerTagDirEntry.name;
        containerTag = containerTag.substring(0, containerTag.indexOf("."));
        if (containerTag === "") {
          containerTag = "latest";
        }
        await buildContainerImage(containerWd, containerName, containerTag);
      }
    }
  }
}
