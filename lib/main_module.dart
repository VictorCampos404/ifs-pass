import 'package:flutter/material.dart';
import 'package:ifs_pass/apps_modules.g.dart';
import 'package:ifs_pass/pages/onboarding/controller/wellcome_controller.dart';
import 'package:ifs_pass/pages/onboarding/wellcome_page.dart';
import 'package:system_package/system.dart';

class MainModule{

  static List<SingleChildWidget> getProviders() {
    List<SingleChildWidget> providers = [];

    //Controllers da aplicação principal
    providers.addAll([
      ChangeNotifierProvider(
        create: (_) => WellcomeController(),
      ),
    ]);

    //Controllers dos subpacotes
    for(final module in APP_MODULES){
      providers.addAll(module.providers);
    }

    return providers;
  }

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    //Rotas da aplicação principal
    routes.addAll({
      SystemRoutes.wellcomePage: (context) => const WellcomePage(),
    });

    //Rotas dos subpacotes
    for(final module in APP_MODULES){
      routes.addAll(module.routes);
    }

    return routes;
  }
}