import 'package:flutter/widgets.dart';
import 'package:system_design_package/system_design.dart';

class IconSize {
  static double converter(SystemSize size) {
    switch (size) {
      case SystemSize.extraLarge:
        return 40;
      case SystemSize.large:
        return 32;
      case SystemSize.medium:
        return 24;
      case SystemSize.small:
        return 16;
    }
  }
}

class ButtonSize {
  static EdgeInsets converter(SystemSize size) {
    switch (size) {
      case SystemSize.extraLarge:
        return EdgeInsets.symmetric(
            horizontal: SystemSpacing.x4.value,
            vertical: SystemSpacing.x1_5.value);
      case SystemSize.large:
        return EdgeInsets.symmetric(
            horizontal: SystemSpacing.x3.value,
            vertical: SystemSpacing.x1_5.value);
      case SystemSize.medium:
        return EdgeInsets.symmetric(
            horizontal: SystemSpacing.x2.value,
            vertical: SystemSpacing.x1.value);
      case SystemSize.small:
        return EdgeInsets.symmetric(
            horizontal: SystemSpacing.x1_5.value,
            vertical: SystemSpacing.x1.value);
    }
  }
}

class IconButtonSize {
  static EdgeInsets converter(SystemSize size) {
    switch (size) {
      case SystemSize.extraLarge:
        return EdgeInsets.all(SystemSpacing.x1_5.value);
      case SystemSize.large:
        return EdgeInsets.all(SystemSpacing.x1_5.value);
      case SystemSize.medium:
        return EdgeInsets.all(SystemSpacing.x1.value);
      case SystemSize.small:
        return EdgeInsets.all(SystemSpacing.x1.value);
    }
  }
}

class IndicatorSize {
  static double converter(SystemSize size) {
    switch (size) {
      case SystemSize.extraLarge:
        return 20;
      case SystemSize.large:
        return 12;
      case SystemSize.medium:
        return 8;
      case SystemSize.small:
        return 8;
    }
  }
}
