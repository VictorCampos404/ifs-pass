import 'dart:io';

import 'build.dart';

class DeleteCommand {
  run(String id) async {

      final appDir = Directory('../lib/apps/$id');

      await appDir.delete(recursive: true);

      final buildCommand = BuildCommand();

      buildCommand.run();
  }
}
