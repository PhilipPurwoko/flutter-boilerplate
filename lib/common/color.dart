import 'package:flutter/material.dart';

const Color colorPrimary = Color(0xFFF29F05);
const Color colorRed = Color(0xFFFF5F5F);
const Color colorRedLight = Color(0xFFFF8682);
const Color colorYellow = Color(0xFFFFA724);
const Color colorGreen = Color(0xFF2FB390);
const Color colorBlue = Color(0xFF3E6CC6);
const Color colorLightBlue = Color(0xFF03BDD0);
const Color colorGrey = Color(0xFF61707D);
const Color colorPurple = Color(0xFF7A3EC6);
const Color colorAppBar = Color(0xFF006F58);
const Color colorBackground = Color(0xFFFFFFFF);
const Color colorLogo = Color(0xFFD2B400);
const Color colorAccent = Color(0xFF3892CD);
const Color colorText = Color(0xFF1F1F1F);
const Color colorTextSecondary = Color(0xFF61707D);
const Color colorButton = colorPrimary;
const Color colorWarningButton = colorRed;
const Color colorCancelButton = colorRed;
const Color colorTextButton = Color(0xFFE0F2F2);
const Color colorCancelTextButton = Color(0xFF525252);
const Color colorHint = Color(0xFF999999);
const Color colorIcon = Color(0xFF0F3234);

Color colorLabelForm = colorAccent.withOpacity(0.7);
Color colorTableHeader = colorPrimary;

MaterialColor materialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
