import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';
import 'package:ifs_pass/apps/carteirinha/consts/routes.dart';
import 'package:ifs_pass/apps/carteirinha/pages/home/controller/home_controller.dart';
import 'package:ifs_pass/apps/carteirinha/pages/home/view/home_page.dart';

class CarteirinhaModule implements SystemAppModule {
  @override
  List<SingleChildWidget> get providers => [
        ChangeNotifierProvider(
          create: (_) => CarteirinhaHomeController(),
        ),
      ];

  @override
  Map<String, Widget Function(BuildContext)> get routes => {
        CarteirinhaRoutes.home: (context) => const CarteirinhaHomePage(),
      };

  @override
  String get id => 'carteirinha';

  @override
  String get name => 'Carteirinha';

  @override
  String get startRoute => CarteirinhaRoutes.home;

  @override
  bool get active => true;

  @override
  bool get canDisable => true;

  @override
  Color? get backgroundIcon => SystemColors.white.value;

  @override
  Color? get colorIcon => SystemColors.primary.value;

  @override
  IconData? get icon => SystemIcons.pass_valid_fill.value;

  @override
  bool? get glass => null;

  @override
  String? get imageIcon => null;
}
