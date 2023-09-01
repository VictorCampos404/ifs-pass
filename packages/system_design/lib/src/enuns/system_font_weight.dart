import 'package:flutter/widgets.dart';

enum SystemFontWeight{
  regular(value: FontWeight.w400),
  medium(value: FontWeight.w500),
  semiBold(value: FontWeight.w600);

  final FontWeight value;
  const SystemFontWeight({required this.value});
}