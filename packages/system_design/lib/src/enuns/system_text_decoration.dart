import 'package:flutter/widgets.dart';

enum SystemTextDecoration{
  none(value: TextDecoration.none),
  lineThrough(value: TextDecoration.lineThrough),
  underline(value: TextDecoration.underline);

  final TextDecoration value;
  const SystemTextDecoration({required this.value});
}