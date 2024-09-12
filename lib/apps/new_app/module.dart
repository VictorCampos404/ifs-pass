import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';
import 'package:ifs_pass/apps/new_app/consts/routes.dart';
import 'package:ifs_pass/apps/new_app/pages/home/controller/home_controller.dart';
import 'package:ifs_pass/apps/new_app/pages/home/view/home_page.dart';

class NewAppModule implements SystemAppModule {
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
  String get id => 'new_app';

  @override
  String get name => 'New App';

  @override
  String get startRoute => NewAppRoutes.home;

  @override
  bool get active => true;

  @override
  bool get canDisable => true;

  @override
  String? get imageIcon => CustomImages.ifspLogo;

  @override
  Color? get backgroundIcon => Colors.white;

  @override
  bool? get glass => null;

  @override
  IconData? get icon => null;

  @override
  Color? get colorIcon => null;
}
