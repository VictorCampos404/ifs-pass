import 'package:flutter/widgets.dart';
import 'package:system_design_package/src/consts/sizes/icon_size.dart';
import 'package:system_design_package/system_design.dart';

class SystemIcon extends StatelessWidget {
  final SystemIcons icon;
  final SystemColors? color;
  final SystemSize? size;
  const SystemIcon(this.icon, {super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon.value,
      color: color?.value ?? SystemColors.neutral800.value,
      size: IconSize.converter(size ?? SystemSize.medium),
    );
  }
}
