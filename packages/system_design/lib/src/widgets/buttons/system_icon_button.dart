import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';

class SystemIconButton extends StatelessWidget {
  const SystemIconButton({
    super.key,
    this.color,
    this.icon,
    this.enable,
    this.onTap,
    this.size,
  });

  final Function()? onTap;
  final SystemIcons? icon;
  final SystemColors? color;
  final double? size;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !(enable ?? true),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          decoration: BoxDecoration(
            color: SystemColors.transparent.value,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            icon?.value,
            color: color?.value ?? SystemColors.neutral800.value,
            size: size,
          ),
        ),
      ),
    );
  }
}
