import 'package:flutter/material.dart';
import 'package:ifs_pass/apps/new_app/consts/routes.dart';
import 'package:ifs_pass/apps/new_app/pages/home/controller/new_app_home_controller.dart';
import 'package:ifs_pass/apps/new_app/pages/home/view/new_app_home_page.dart';
import 'package:system_package/system.dart';

class NewAppModule implements SystemAppModule{
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
  String id = 'new_app';
  
  @override
  String name = 'New App';

  @override
  String startRoute = NewAppRoutes.home;
  
  @override
  bool active = true;
  
  @override
  bool canDisable = true;
  
}