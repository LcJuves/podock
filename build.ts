import * as log from "https://deno.land/std@0.142.0/log/mod.ts";
import { join } from "https://deno.land/std@0.142.0/path/mod.ts";
import { parse } from "https://deno.land/std@0.142.0/flags/mod.ts";

import containerImages from "./containerImages.json" assert { type: "json" };

const parsedArgs = parse(Deno.args, { "--": false });
// console.dir(parsedArgs);
const currentWorkingDirectory = Deno.cwd();
const buildType: string = parsedArgs["buildType"] ?? "linux";
const ignoreDirs = (parsedArgs["ignoreDirs"] ?? "").split(",");
const push = (parsedArgs["push"] ?? "false") === "true";
// console.dir({ buildType, ignoreDirs, push });

async function execCommand(
  cwd: string,
  cmd: string | URL,
  args: string[],
): Promise<number> {
  const command = new Deno.Command(cmd, {
    args,
    cwd,
  });
  const child = command.spawn();
  const status = await child.status;
  return status.code;
}

async function execDockerCommand(cwd: string, args: string[]): Promise<number> {
  return await execCommand(cwd, "docker", args);
}

async function buildContainerImage(
  wd: string,
  containerName: string,
  containerTag: string,
) {
  const imageName = `${containerName}:${containerTag}`;
  const envCiRegistryUser = Deno.env.get("CI_REGISTRY_USER") ?? "";
  if (buildType === "linux" && containerTag.indexOf("win") !== -1) {
    log.info(`Skip windows' container image ${imageName}`);
    return;
  } else if (buildType === "windows" && containerTag.indexOf("win") === -1) {
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

  try {
    await Deno.stat(join(wd, dockerfileName));
  } catch (_) {
    log.error(`Unable to find \`${dockerfileName}\` in directory \`${wd}\`!`);
    Deno.exit(1);
  }

  const dockerBuildStatusCode = await execDockerCommand(wd, [
    "build",
    "-t",
    imageName,
    "-f",
    dockerfileName,
    ".",
  ]);
  if (dockerBuildStatusCode !== 0) {
    log.error(`Building image ${imageName} with error!`);
    Deno.exit(dockerBuildStatusCode);
  } else {
    log.info(`Build image ${imageName} succeed!`);
  }

  if (push && envCiRegistryUser !== "") {
    const remoteImageName = `${envCiRegistryUser}/${imageName}`;

    const dockerTagStatusCode = await execDockerCommand(wd, [
      "tag",
      imageName,
      remoteImageName,
    ]);
    if (dockerTagStatusCode !== 0) {
      log.error(`Tagging image ${imageName} with error!`);
      Deno.exit(dockerTagStatusCode);
    } else {
      log.info(`Tagging image ${imageName} succeed!`);
    }

    const dockerPushStatusCode = await execDockerCommand(wd, [
      "push",
      imageName,
    ]);
    if (dockerPushStatusCode !== 0) {
      log.error(`Pushing image ${imageName} with error!`);
      Deno.exit(dockerPushStatusCode);
    } else {
      log.info(`Push image ${imageName} succeed!`);
    }
  }
}

log.info("Starting pre-build ...");
const bashStatusCode = await execCommand(currentWorkingDirectory, "bash", [
  "-e",
  "pre-build.sh",
]);
if (bashStatusCode !== 0) {
  log.error("Pre-building with error!");
  Deno.exit(bashStatusCode);
} else {
  log.info("Pre-build succeed!");
}

rootLoop:
for (const containerImage of containerImages) {
  const containerName = containerImage.name;
  for (const ignoreDir of ignoreDirs) {
    if (ignoreDir === containerName) {
      continue rootLoop;
    }
  }
  const containerWd = join(currentWorkingDirectory, containerName);
  for (const containerTag of containerImage.tags) {
    await buildContainerImage(containerWd, containerName, containerTag);
  }
}
