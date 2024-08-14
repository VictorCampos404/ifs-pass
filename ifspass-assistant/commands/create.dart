import '../generator/file_type.dart';
import '../generator/generator.dart';
import '../generator/key_type.dart';

class CreateCommand {
  run(String name) async {
    if (_isValidName(name)) {
      final generator = Generator();
      await generator.task(
        fileType: FileType.module,
        keys: {
          KeyType.appName: 'AppTeste',
          KeyType.appId: 'app_teste',
        },
        path: 'module.dart',
      );
    }
  }

  bool _isValidName(String name) {
    return true;
  }
}
