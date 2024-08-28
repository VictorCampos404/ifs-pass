import 'package:flutter/material.dart';
import 'package:system_design_package/src/consts/sizes/widgets_size.dart';
import 'package:system_design_package/system_design.dart';

class SystemPrimaryButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final SystemSize? size;
  final SystemColors? backgroundColor;
  final SystemColors? textColor;
  final SystemColors? borderColor;
  final bool? expanded;
  final bool? enable;
  final bool? loading;
  const SystemPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.size,
    this.backgroundColor,
    this.textColor,
    this.enable,
    this.loading,
    this.expanded,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !(enable ?? true) || (loading ?? false),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        opacity: (enable ?? true) ? 1 : 0.5,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: (expanded ?? false) ? MediaQuery.of(context).size.width : null,
          child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                (enable ?? true)
                    ? backgroundColor?.value ?? SystemColors.primary.value
                    : SystemColors.neutral400.value,
              ),
              side: borderColor != null
                  ? MaterialStateProperty.all(
                      BorderSide(
                        color: borderColor!.value,
                      ),
                    )
                  : null,
              padding: MaterialStateProperty.all(
                ButtonSize.converter(
                  size ?? SystemSize.medium,
                ),
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: MaterialStateProperty.all(1),
              shadowColor: MaterialStateProperty.all(
                SystemColors.neutral800.value,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: (loading ?? false)
                ? SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: textColor?.value ?? SystemColors.white.value,
                      strokeWidth: 2,
                    ),
                  )
                : (size ?? SystemSize.medium) == SystemSize.small
                    ? Text(
                        text,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ).caption(
                        fontWeight: SystemFontWeight.medium,
                        color: textColor ?? SystemColors.white)
                    : Text(
                        text,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ).body1(
                        fontWeight: SystemFontWeight.medium,
                        color: textColor ?? SystemColors.white,
                      ),
          ),
        ),
      ),
    );
  }
}
