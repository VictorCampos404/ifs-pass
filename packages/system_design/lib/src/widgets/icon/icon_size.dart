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
