import 'dart:io';

import 'file_type.dart';
import 'key_type.dart';

class Generator {
  Future<void> task({
    required FileType fileType,
    required Map<KeyType, String> keys,
    required String path,
  }) async {
    final templateFile = File(fileType.path);
    final lines = templateFile.readAsLinesSync();
    String fileString = '';

    keys.forEach((key, value) {
      for (int i = 0; i < lines.length; i++) {
        if (lines[i].contains(key.value)) {
          lines[i] = lines[i].replaceAll(key.value, value);
          print(lines[i]);
        }
      }
    });

    for (String line in lines) {
      fileString += '$line\n';
    }

    final genereteFile = File(path);

    if (genereteFile.existsSync()) {
      await genereteFile.delete();
    }

    await genereteFile.create();
    await genereteFile.writeAsString(fileString);
  }
}
