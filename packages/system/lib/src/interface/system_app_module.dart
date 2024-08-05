import 'package:flutter/material.dart';
import 'package:system_package/system.dart';

abstract class SystemAppModule{
  List<SingleChildWidget> get providers;
  Map<String, Widget Function(BuildContext)> get routes;
  late String id;
  late String name;
  late String startRoute;
  late bool active;
  late bool canDisable;
}