import 'package:flutter/widgets.dart';
import 'package:system_design_package/src/icons/custom_icons.dart';

enum SystemIcons{
  a_b(value: CustomIcons.a_b);

  final IconData value;
  const SystemIcons({required this.value});
}