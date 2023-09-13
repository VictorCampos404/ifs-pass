import 'package:flutter/material.dart';
import 'package:system_design_package/src/consts/shadows/system_shadows.dart';
import 'package:system_design_package/src/consts/sizes/widgets_size.dart';
import 'package:system_design_package/system_design.dart';

class SystemIconButton extends StatelessWidget {
  final Function() onTap;
  final SystemColors? iconColor;
  final SystemSize? size;
  final SystemColors? backgroundColor;
  final bool? enable;
  final bool? loading;
  final SystemIcons icon;
  const SystemIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.size,
    this.backgroundColor,
    this.enable,
    this.loading,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !(enable ?? true) || (loading ?? false),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        opacity: (enable ?? true) ? 1 : 0.12,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
              padding: IconButtonSize.converter(size ?? SystemSize.medium),
              decoration: BoxDecoration(
                color: backgroundColor?.value ?? SystemColors.primary.value,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: SystemShadow100().value,
              ),
              child: (loading ?? false)
                  ? CircularProgressIndicator(
                      color: iconColor?.value ?? SystemColors.white.value,
                      strokeWidth: 2,
                    )
                  : SystemIcon(icon,
                      color: iconColor ?? SystemColors.white, size: size)),
        ),
      ),
    );
  }
}
