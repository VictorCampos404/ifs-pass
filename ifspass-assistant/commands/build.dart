import 'dart:io';

import '../generator/file_type.dart';
import '../generator/generator.dart';
import '../generator/key_type.dart';

class BuildAppData {
  final String path;
  final String name;

  BuildAppData({
    required this.path,
    required this.name,
  });
}

class BuildCommand {
  run() async {

    final dir = Directory('../lib/apps');
    final appsModules = File('../lib/apps_modules.g.dart');
    final buildApps = <BuildAppData>[];

    try {
      final apps = await dir.list().toList();

      print('Lendo apps...');

      for (final app in apps) {
        final module = File('${app.path}/module.dart');

        if (module.existsSync()) {
          final lines = module.readAsLinesSync();

          final nameLine =
              lines.where((line) => line.startsWith('class')).toString();
          final words = nameLine.split(' ');

          if (words.length >= 2) {
            final folders = module.path.split('/');

            String path = 'import \'package:ifs_pass';

            for (int i = 2; i < folders.length; i++) {
              path += '/${folders[i]}';
            }

            path += '\';';
            path = path.replaceAll('\\', '/');

            buildApps.add(
              BuildAppData(
                path: path,
                name: '  ${words[1]}(),',
              ),
            );
          }
        }
      }

      final generator = Generator();
      String imports = '';
      String instances = '';

      for (int i = 0; i < buildApps.length; i++) {
        final buildApp = buildApps[i];

        imports += '${buildApp.path}${i+1 == buildApps.length ? '' : '\n'}';
      }

      for (int i = 0; i < buildApps.length; i++) {
        final buildApp = buildApps[i];

        instances += '${buildApp.name}${i+1 == buildApps.length ? '' : '\n'}';
      }

      await generator.task(
        fileType: FileType.appsModules, 
        keys: {
          KeyType.imports: imports,
          KeyType.instances: instances,
        }, 
        path: appsModules.path,
      );

      print('build relizada com sucesso...');

    } catch (error) {
      print(error);
    }
  }
}
