import 'package:flutter/material.dart';

class AiColors {
  AiColors();

  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteSmoke = Color(0xFFF4F4F4);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF444444);

  static const Color text = Color(0xFF2C2C2C);
  static const Color text2 = Color(0xFF6C6C6C);
  static Color disable = const Color(0xFF747474).withOpacity(0.5);

  static const Color success = Color(0xFF0C7C59);
  static const Color error = Color(0xFFC01E2D);
  static const Color warning = Color(0xFFFFBA08);

  static const Color purple = Color(0xFFD9D4FF);
  static const Color background = Color(0xFF0D0D0D);

  static const MaterialColor primary = MaterialColor(0xFF7012d2, {
    50: Color(0xFF7012d2),
    100: Color(0xFF7012d2),
    200: Color(0xFF7012d2),
    300: Color(0xFF7012d2),
    400: Color(0xFF7012d2),
    500: Color(0xFF7012d2),
    600: Color(0xFF7012d2),
    700: Color(0xFF7012d2),
    800: Color(0xFF7012d2),
    900: Color(0xFF7012d2),
  });
}
