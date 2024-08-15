import 'commands/build.dart';
import 'commands/create.dart';
import 'commands/delete.dart';

main(List<String> arguments){
  
  if(arguments.isEmpty){
    print('Erro de sintaxe...');
    return;
  }

  switch(arguments.first){
    case 'create': 
      final createCommand = CreateCommand();

      if(arguments.length != 3){
        print('Erro de sintaxe...');
        return;
      }

      final name = arguments[1];
      final id = arguments[2];
      
      createCommand.run(name, id);
    break;

    case 'build': 
      
      final buildCommand = BuildCommand();

      buildCommand.run();

    break;

    case 'delete': 
      final deleteCommand = DeleteCommand();

      if(arguments.length != 2){
        print('Erro de sintaxe...');
        return;
      }

      final id = arguments[1];
      
      deleteCommand.run(id);
    break;
  }

}