import 'package:flutter/widgets.dart';
import 'package:system_design_package/src/consts/icons/custom_icons.dart';

enum SystemIcons {
  a_b(value: CustomIcons.a_b),
  arrow_left_s_line(value: CustomIcons.arrow_left_s_line),
  add_fill(value: CustomIcons.add_fill),
  home_6_fill(value: CustomIcons.home_6_fill);

  final IconData value;
  const SystemIcons({required this.value});
}
