import 'package:flutter/material.dart';
import 'package:system_design_package/src/consts/shadows/system_shadows.dart';
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
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              app.startRoute,
            );
          },
          child: Container(
            margin: EdgeInsets.only(
              bottom: SystemSpacing.x0_5.value,
            ),
            decoration: BoxDecoration(
              color: SystemColors.primary.value,
              borderRadius: BorderRadius.circular(
                5,
              ),
              boxShadow: SystemShadow100().value,
            ),
            width: size,
            height: size,
          ),
        ),
        Text(
          app.name,
        ).caption(
          fontWeight: SystemFontWeight.semiBold,
          color: SystemColors.white,
        )
      ],
    );
  }
}
