import 'dart:io';
import 'dart:convert';

import 'package:args/args.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

final log = Logger("BuildContainerImages");

var parser = ArgParser();
ArgResults initArgParser(List<String> args) {
  parser.addOption('buildType',
      abbr: 'B', allowed: ['linux', 'windows'], defaultsTo: 'linux');
  parser.addOption('ignoreDirs', abbr: 'I', defaultsTo: '');
  parser.addOption('push',
      abbr: 'P', allowed: ['false', 'true'], defaultsTo: 'false');
  parser.addOption('containerInfoFile',
      abbr: 'C', defaultsTo: 'containerImages.json');
  return parser.parse(args);
}

Future<int> execCommand(String wd, String cmd, List<String> args) async {
  var process = await Process.start(cmd, args, workingDirectory: wd);
  stdout.addStream(process.stdout);
  stderr.addStream(process.stderr);
  return process.exitCode;
}

Future<int> execContainerProviderCommand(String wd, List<String> args) async {
  return await execCommand(wd, 'docker', args);
}

Future<void> buildContainerImage(String wd, String buildType,
    String containerName, String containerTag, bool push) async {
  final imageName = "$containerName:$containerTag";
  final envCIRegistryUser = Platform.environment["CI_REGISTRY_USER"] ?? '';
  if (buildType == 'linux' && containerTag.contains('win')) {
    log.info("Skip windows' container image ${imageName}");
    return;
  }
  if (buildType == 'windows' && !containerTag.contains('win')) {
    log.info("Skip linux's container image ${imageName}");
    return;
  }
  log.info("Starting build image ${imageName} ...");
  var dockerfileName = "${containerTag}.Dockerfile";
  if (!File(p.join(wd, dockerfileName)).existsSync()) {
    dockerfileName = "Dockerfile";
  }
  if (!File(p.join(wd, dockerfileName)).existsSync()) {
    log.severe("Unable to find `$dockerfileName` in directory `$wd`!");
    exit(1);
  }

  final dockerBuildStatusCode = await execContainerProviderCommand(wd, [
    "build",
    "--platform=$buildType/amd64",
    "-t",
    imageName,
    "-f",
    dockerfileName,
    ".",
  ]);
  if (dockerBuildStatusCode != 0) {
    log.severe("Building image $imageName with error!");
    exit(dockerBuildStatusCode);
  } else {
    log.info("Build image ${imageName} succeed!");
  }

  if (push && envCIRegistryUser.isNotEmpty) {
    final remoteImageName = "$envCIRegistryUser/$imageName";
    final dockerTagStatusCode = await execContainerProviderCommand(wd, [
      "tag",
      imageName,
      remoteImageName,
    ]);
    if (dockerTagStatusCode != 0) {
      log.severe("Tagging image ${imageName} with error!");
      exit(dockerTagStatusCode);
    } else {
      log.info("Tagging image ${imageName} succeed!");
    }

    final dockerPushStatusCode = await execContainerProviderCommand(wd, [
      "push",
      remoteImageName,
    ]);
    if (dockerPushStatusCode != 0) {
      log.severe("Pushing image ${remoteImageName} with error!");
      exit(dockerPushStatusCode);
    } else {
      log.info("Push image ${remoteImageName} succeed!");
    }
  }
}

Future<void> execPreBuild(String wd) async {
  log.info("Starting pre-build ...");
  final bashStatusCode = await execCommand(wd, "sh", ["-e", "pre-build.sh"]);
  if (bashStatusCode != 0) {
    log.severe("Pre-building with error!");
    exit(bashStatusCode);
  } else {
    log.info("Pre-build succeed!");
  }
}

Future<dynamic> readContainerImages(String wd, String containerInfoFile) async {
  final fullPath = p.join(wd, containerInfoFile);
  final josnString = await File(fullPath).readAsString();
  return jsonDecode(josnString);
}

Future<void> main(List<String> args) async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print(
        '${record.level.name}: ${record.time.toUtc().toIso8601String()}: ${record.message}');
  });

  final results = initArgParser(args);
  final buildType = results['buildType'];
  final ignoreDirs = results['ignoreDirs'].toString().split(',');
  final push = bool.parse(results['push']);
  final containerInfoFile = results['containerInfoFile'];

  final currentScriptPath = Platform.script.normalizePath().toFilePath();
  final cwd = currentScriptPath.substring(
      0, currentScriptPath.lastIndexOf(Platform.pathSeparator));

  await execPreBuild(cwd);
  final containerImages = await readContainerImages(cwd, containerInfoFile);
  rootLoop:
  for (final containerImage in containerImages) {
    final containerName = containerImage["name"];
    for (final ignoreDir in ignoreDirs) {
      if (ignoreDir == containerName) {
        continue rootLoop;
      }
    }
    final containerWd = p.join(cwd, containerName);
    for (final containerTag in containerImage["tags"]) {
      await buildContainerImage(
          containerWd, buildType, containerName, containerTag, push);
    }
  }
}
