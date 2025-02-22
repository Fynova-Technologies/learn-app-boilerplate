// Copyright (c) 2023. The Abishek Authors. All rights reserved.

import 'dart:io';

import 'package:path/path.dart';

Future<void> main() async {
  final scriptPath = Platform.script.toFilePath();
  final rootPath = scriptPath.replaceAll(
    RegExp('.packages.+'),
    '',
  );

  final assetsPath = join(
    rootPath,
    'packages',
    'learn_resources',
    'assets',
  );
  final assetsDir = Directory(assetsPath);
  final assetsManifest = <String, Map<String, String>>{};

  for (final fileEntity in assetsDir.listSync(recursive: true)) {
    final fileEntityStat = await fileEntity.stat();

    if (fileEntityStat.type == FileSystemEntityType.file) {
      final folderPath = fileEntity.parent.path;

      if (folderPath.endsWith('bin')) continue;

      final binFolderPath = '$folderPath-bin';
      final binFolder = Directory(binFolderPath);
      if (!binFolder.existsSync()) await binFolder.create();

      final folderName = basename(folderPath);
      final fileName = basename(fileEntity.path);
      final binFileName = '$fileName.vec';

      final folderManifest = assetsManifest.putIfAbsent(folderName, () => {});
      folderManifest[fileName] = 'assets/$folderName-bin/$binFileName';

      stdout.writeln(
        '[$folderName] Compiling: $fileName -> $binFileName',
      );
      final result = await Process.run(
        'dart',
        [
          'run',
          'vector_graphics_compiler',
          '-i',
          join(folderPath, fileName),
          '-o',
          join(binFolderPath, binFileName),
        ],
        workingDirectory: assetsDir.parent.path,
      );
      stderr.write(result.stderr);
    }
  }

  final assetBuffer = StringBuffer()
    ..writeln(
      '// File generated by "melos run svg". Do not edit by hand.',
    )
    ..writeln(
      '// Copyright (c) 2023. The Abishek Authors. All rights reserved.',
    )
    ..writeln()
    ..writeln('final class Asset {')
    ..writeAll(
      assetsManifest.keys.map(
        (key) {
          final className = 'Asset${_kebabToPascalCase(key)}';
          return '  static const $className $key = $className();\n';
        },
      ),
    )
    ..writeln('}')
    ..writeln()
    ..writeAll(
      assetsManifest.keys.map(
        (folder) {
          final className = 'Asset${_kebabToPascalCase(folder)}';

          return StringBuffer('final class $className {\n')
            ..writeln('  const $className();')
            ..writeln()
            ..writeAll(
              assetsManifest[folder]!.entries.map(
                (e) {
                  final name = _kebabToCamelCase(e.key.split('.').first);

                  return "  String get $name => '${e.value}';\n";
                },
              ),
            )
            ..writeln('}');
        },
      ),
    );

  await File(join(assetsDir.parent.path, 'lib', 'src', 'asset.dart'))
      .writeAsString(assetBuffer.toString());
  stdout.writeln('\nAssets Generated Successfully!\n');
}

String _kebabToPascalCase(String input) {
  return _kebabToCamelCase(input).replaceFirstMapped(
    RegExp(r'^\w'),
    (match) => match.group(0)!.toUpperCase(),
  );
}

String _kebabToCamelCase(String input) {
  final regex = RegExp(r'-(\w)');
  return input.replaceAllMapped(
    regex,
    (match) {
      final matchedString = match.group(0)!;
      return matchedString[1].toUpperCase();
    },
  );
}
