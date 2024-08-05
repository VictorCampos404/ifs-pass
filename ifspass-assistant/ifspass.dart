import 'commands/build.dart';
import 'commands/create.dart';

main(List<String> arguments){
  
  if(arguments.isEmpty){
    print('Erro de sintaxe...');
    return;
  }

  switch(arguments.first){
    case 'create': 
      final createCommand = CreateCommand();

      if(arguments.length != 2){
        print('Erro de sintaxe...');
        return;
      }

      final name = arguments[1];
      
      createCommand.run(name);
    break;

    case 'build': 
      
      final buildCommand = BuildCommand();

      buildCommand.run();

    break;
  }

}