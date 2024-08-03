import 'package:flutter/material.dart';
import 'package:ifs_pass/apps/new_app/consts/routes.dart';
import 'package:ifs_pass/apps/new_app/pages/home/controller/new_app_home_controller.dart';
import 'package:ifs_pass/apps/new_app/pages/home/view/new_app_home_page.dart';
import 'package:system_package/system.dart';

abstract class AppModule{
  List<SingleChildWidget> get providers;
  Map<String, Widget Function(BuildContext)> get routes;
  late String name;
}

class NewAppModule implements AppModule{
  @override
  List<SingleChildWidget> get providers => [
    ChangeNotifierProvider(
      create: (_) => NewAppHomeController(),
    ),
  ];

  @override
  Map<String, Widget Function(BuildContext)> get routes => {
    NewAppRoutes.home: (context) => const NewAppHomePage(),
  };
  
  @override
  String name = 'new_app';
  

}