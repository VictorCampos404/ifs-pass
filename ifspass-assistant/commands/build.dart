import 'dart:io';

class BuildAppData{
  final String path;
  final String name;

  BuildAppData({
    required this.path,
    required this.name,
  });
}

class BuildCommand {
  run() async {
    
    final dir = Directory('..\\lib\\apps');
    final appsModules = File('..\\lib\\apps_modules.g.dart');
    final buildApps = <BuildAppData>[];

    try{

      final apps = await dir.list().toList();

      print('Lendo apps...');

      for(final app in apps){
        final module = File('${app.path}\\module.dart');

        if(module.existsSync()){
          final lines = module.readAsLinesSync();

          final nameLine = lines.where((line) => line.startsWith('class')).toString();
          final words = nameLine.split(' ');

          if(words.length >= 2){

            final folders = module.path.split('\\');

            String path = 'import \'package:ifs_pass';

            for(int i = 2; i < folders.length; i++){
              path += '/${folders[i]}';
            }

            path += '\';';

            buildApps.add(
              BuildAppData(
                path: path, 
                name: '  ${words[1]}(),',
              ),
            );
          }
        }
      }

      if(appsModules.existsSync()){
        await appsModules.delete();
        print('Arquivo apps_modules.g.dart deletado...');
      }

      await appsModules.create();

      String linesFile = 
        '//\n'
        '// NÃO EDITAR, ARQUIVO GERADO POR CÓDIGO\n'
        '//\n'
        '\n'
        'import \'package:system_package/system.dart\';\n';

      for(final buildApp in buildApps){
        linesFile += '${buildApp.path}\n';
      }

      linesFile += 
        '\n'
        'List<SystemAppModule> get APP_MODULES => [\n';
      
      for(final buildApp in buildApps){
        linesFile += '${buildApp.name}\n';
      }

      linesFile += 
        '];'
        '\n';

      appsModules.writeAsString(linesFile);

      print('Arquivo apps_modules.g.dart criado...');

    }catch(error){
      print(error);
    }

  }
}