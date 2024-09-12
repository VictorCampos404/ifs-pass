import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';
import 'package:ifs_pass/apps/ai/consts/routes.dart';
import 'package:ifs_pass/apps/ai/pages/home/controller/home_controller.dart';
import 'package:ifs_pass/apps/ai/pages/home/view/home_page.dart';

class AiModule implements SystemAppModule {
  @override
  List<SingleChildWidget> get providers => [
        ChangeNotifierProvider(
          create: (_) => AiHomeController(),
        ),
      ];

  @override
  Map<String, Widget Function(BuildContext)> get routes => {
        AiRoutes.home: (context) => const AiHomePage(),
      };

  @override
  String get id => 'ai';

  @override
  String get name => 'Ifsp Ai';

  @override
  String get startRoute => AiRoutes.home;

  @override
  bool get active => true;

  @override
  bool get canDisable => true;

  @override
  Color? get backgroundIcon => Colors.black;

  @override
  Color? get colorIcon => Colors.purple;

  @override
  IconData? get icon => SystemIcons.robot_fill.value;

  @override
  bool? get glass => null;

  @override
  String? get imageIcon => null;
}
