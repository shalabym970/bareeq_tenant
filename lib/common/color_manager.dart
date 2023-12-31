import 'package:flutter/material.dart';

Map<int, Color> lightTheme = {
  50: const Color(0x1AFFFFFF),
  100: const Color(0x26FFFFFF),
  200: const Color(0x33FFFFFF),
  300: const Color(0x4DFFFFFF),
  400: const Color(0x66FFFFFF),
  500: const Color(0x80FFFFFF),
  600: const Color(0x99FFFFFF),
  700: const Color(0xB3FFFFFF),
  800: const Color(0xCCFFFFFF),
  900: const Color(0xE6FFFFFF),
};

class ColorManager {
  static Color white = const Color(0xffFFFFFF);
  static Color textFieldBg = const Color(0xffF5F7FF);
  static Color black = const Color(0xff000000);
  static Color mainColor = const Color(0xff112838);
  static Color chatColorMe = const Color(0xffFCE4BA);
  static Color severityColor = const Color(0xffFAD28C);
  static MaterialColor primarySwatchColors =
      MaterialColor(0xFFFFFFFF, lightTheme);
  static Color red = const Color(0xFFFF0000);
  static Color yellow = const Color(0xFFFFB319);
  static Color purple = const Color(0xFFFF5DA2);
  static Color lightBlue = const Color(0xFF5CB0FF);
  static Color lightGrey = const Color(0xFFE4E7EB);
  static Color darkGrey = const Color(0x33FFFFFF);
  static Color grey = Colors.grey;
  static Color orange = Colors.orangeAccent;
  static Color green = const Color(0xFF4CBB17);
}
