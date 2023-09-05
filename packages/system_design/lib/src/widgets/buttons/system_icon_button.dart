import 'package:flutter/material.dart';
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
        child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size.zero),
              backgroundColor: MaterialStateProperty.all(
                  backgroundColor?.value ?? SystemColors.primary.value),
              padding: MaterialStateProperty.all(
                  IconButtonSize.converter(size ?? SystemSize.medium)),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: MaterialStateProperty.all(1),
              shadowColor:
                  MaterialStateProperty.all(SystemColors.neutral800.value),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
            ),
            child: (loading ?? false)
                ? CircularProgressIndicator(
                    color: iconColor?.value ?? SystemColors.white.value,
                    strokeWidth: 2,
                  )
                : SystemIcon(icon,
                    color: iconColor ?? SystemColors.white, size: size)),
      ),
    );
  }
}
