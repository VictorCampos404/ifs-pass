import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class SystemApp extends StatelessWidget {
  const SystemApp({
    super.key,
    required this.app,
  });

  final SystemAppModule app;

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.sizeOf(context).width -
            (SystemSpacing.x2.value * (4 + 1))) /
        4;

    return Column(
      children: [
        Material(
          color: app.glass ?? false
              ? SystemColors.transparent.value
              : app.backgroundIcon ?? SystemColors.primary.value,
          borderRadius: BorderRadius.circular(
            5,
          ),
          elevation: 3,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              Navigator.pushNamed(
                context,
                app.startRoute,
              );
            },
            onLongPress: () {},
            child: app.glass ?? false
                ? GlassContainer(
                    width: size,
                    height: size,
                    radius: 5,
                    alignment: Alignment.center,
                    child: app.icon != null
                        ? Icon(
                            app.icon,
                            color: app.colorIcon ?? SystemColors.white.value,
                            size: size - SystemSpacing.x4.value,
                          )
                        : app.imageIcon != null
                            ? Image.asset(
                                app.imageIcon ?? '',
                                width: size - SystemSpacing.x4.value,
                                height: size - SystemSpacing.x4.value,
                              )
                            : const SizedBox(),
                  )
                : Container(
                    width: size,
                    height: size,
                    alignment: Alignment.center,
                    child: app.icon != null
                        ? Icon(
                            app.icon,
                            color: app.colorIcon ?? SystemColors.white.value,
                            size: size - SystemSpacing.x4.value,
                          )
                        : app.imageIcon != null
                            ? Image.asset(
                                app.imageIcon ?? '',
                                width: size - SystemSpacing.x4.value,
                                height: size - SystemSpacing.x4.value,
                              )
                            : const SizedBox(),
                  ),
          ),
        ),
        Container(
          width: size,
          padding: EdgeInsets.only(
            top: SystemSpacing.x0_5.value,
          ),
          child: Text(
            app.name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ).caption(
            fontWeight: SystemFontWeight.semiBold,
            color: SystemColors.white,
          ),
        )
      ],
    );
  }
}
