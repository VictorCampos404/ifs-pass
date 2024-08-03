import 'package:flutter/material.dart';
import 'package:ifs_pass/apps/new_app/module.dart';

class MainRoutes{
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    final newApp = NewAppModule();

    //Listar todos os apps
    routes.addAll(newApp.routes);

    return routes;
  }
}