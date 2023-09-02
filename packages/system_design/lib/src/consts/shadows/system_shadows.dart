import 'package:flutter/widgets.dart';
import 'package:system_design_package/src/consts/colors/custom_colors.dart';
import 'package:system_design_package/src/consts/shadows/custom_shadows.dart';

class SystemShadow100 implements CustomShadows {
  @override
  List<BoxShadow> get value => [
        BoxShadow(
          offset: const Offset(0, 1),
          color: CustomColors.neutral800.withOpacity(0.12),
          blurRadius: 2,
        )
      ];
}

class SystemShadow200 implements CustomShadows {
  @override
  List<BoxShadow> get value => [
        BoxShadow(
            offset: const Offset(0, 2),
            color: CustomColors.neutral800.withOpacity(0.04),
            blurRadius: 2,
            spreadRadius: 1),
        BoxShadow(
            offset: const Offset(0, 2),
            color: CustomColors.neutral800.withOpacity(0.12),
            blurRadius: 8,
            spreadRadius: -1),
      ];
}

class SystemShadow300 implements CustomShadows {
  @override
  List<BoxShadow> get value => [
        BoxShadow(
            offset: const Offset(0, 2),
            color: CustomColors.neutral800.withOpacity(0.04),
            blurRadius: 2,
            spreadRadius: -1),
        BoxShadow(
            offset: const Offset(0, 8),
            color: CustomColors.neutral800.withOpacity(0.12),
            blurRadius: 16,
            spreadRadius: -2)
      ];
}

class SystemShadow400 implements CustomShadows {
  @override
  List<BoxShadow> get value => [
        BoxShadow(
            offset: const Offset(0, 2),
            color: CustomColors.neutral800.withOpacity(0.04),
            blurRadius: 2,
            spreadRadius: -1),
        BoxShadow(
            offset: const Offset(0, 16),
            color: CustomColors.neutral800.withOpacity(0.16),
            blurRadius: 24,
            spreadRadius: -4)
      ];
}
