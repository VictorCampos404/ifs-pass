import 'dart:io';

import '../generator/file_type.dart';
import '../generator/generator.dart';
import '../generator/key_type.dart';
import 'build.dart';

class CreateCommand {
  run(String name, String id) async {

      final appDir = Directory('../lib/apps/$id');
      final appAssetsDir = Directory('../lib/apps/$id/assets');
      final appConstsDir = Directory('../lib/apps/$id/consts');
      final appPagesDir = Directory('../lib/apps/$id/pages');
      final appHomeDir = Directory('../lib/apps/$id/pages/home');
      final appHomeControllerDir = Directory('../lib/apps/$id/pages/home/controller');
      final appHomeModelDir = Directory('../lib/apps/$id/pages/home/model');
      final appHomeViewDir = Directory('../lib/apps/$id/pages/home/view');

      await appDir.create();
      await appAssetsDir.create();
      await appConstsDir.create();
      await appPagesDir.create();
      await appHomeDir.create();
      await appHomeControllerDir.create();
      await appHomeModelDir.create();
      await appHomeViewDir.create();

      File routes = File('${appConstsDir.path}/routes.dart');
      File homeController = File('${appHomeControllerDir.path}/home_controller.dart');
      File homePage = File('${appHomeViewDir.path}/home_page.dart');
      File module = File('${appDir.path}/module.dart');

      final generator = Generator();

      await generator.task(
        fileType: FileType.routes,
        keys: {
          KeyType.appName: name,
          KeyType.appId: id,
        },
        path: routes.path,
      );

      await generator.task(
        fileType: FileType.homeController,
        keys: {
          KeyType.appName: name,
          KeyType.appId: id,
        },
        path: homeController.path,
      );

      await generator.task(
        fileType: FileType.homePage,
        keys: {
          KeyType.appName: name,
          KeyType.appId: id,
        },
        path: homePage.path,
      );

      await generator.task(
        fileType: FileType.module,
        keys: {
          KeyType.appName: name,
          KeyType.appId: id,
        },
        path: module.path,
      );

      final buildCommand = BuildCommand();

      buildCommand.run();
  }
}
