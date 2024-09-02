import 'package:flutter/material.dart';
import 'package:ifs_pass/apps_modules.g.dart';
import 'package:ifs_pass/pages/home/view/home_page.dart';
import 'package:ifs_pass/pages/onboarding/view/confirm_pin_page.dart';
import 'package:ifs_pass/pages/onboarding/view/consent_page.dart';
import 'package:ifs_pass/pages/onboarding/controller/wellcome_controller.dart';
import 'package:ifs_pass/pages/onboarding/view/login_page.dart';
import 'package:ifs_pass/pages/onboarding/view/pin_page.dart';
import 'package:ifs_pass/pages/onboarding/view/wallpaper_page.dart';
import 'package:ifs_pass/pages/onboarding/view/wellcome_page.dart';
import 'package:system_package/system.dart';

class MainModule {
  static List<SingleChildWidget> getProviders() {
    List<SingleChildWidget> providers = [];

    //Controllers da aplicação principal
    providers.addAll([
      ChangeNotifierProvider(
        create: (_) => WellcomeController(),
      ),
    ]);

    //Controllers dos subpacotes
    for (final module in APP_MODULES) {
      providers.addAll(module.providers);
    }

    return providers;
  }

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    //Rotas da aplicação principal
    routes.addAll({
      SystemRoutes.wellcomePage: (context) => const WellcomePage(),
      SystemRoutes.loginPage: (context) => const LoginPage(),
      SystemRoutes.consentPage: (context) => const ConsentPage(),
      SystemRoutes.wallpaperPage: (context) => const WallpaperPage(),
      SystemRoutes.pinPage: (context) => const PinPage(),
      SystemRoutes.confirmPinPage: (context) => const ConfirmPinPage(),
      SystemRoutes.wellcomePage: (context) => const WellcomePage(),
      SystemRoutes.home: (context) => const HomePage(),
    });

    //Rotas dos subpacotes
    for (final module in APP_MODULES) {
      routes.addAll(module.routes);
    }

    return routes;
  }
}
