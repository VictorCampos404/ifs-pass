import 'package:flutter/material.dart';
import 'package:system_package/system.dart';

abstract class SystemAppModule {
  List<SingleChildWidget> get providers;
  Map<String, Widget Function(BuildContext)> get routes;
  String get id;
  String get name;
  String get startRoute;
  bool get active;
  bool get canDisable;
  Color? get backgroundIcon;
  Color? get colorIcon;
  bool? get glass;
  String? get imageIcon;
  IconData? get icon;
}
