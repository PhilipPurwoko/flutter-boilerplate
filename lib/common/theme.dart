import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_boilerplate/common/color.dart';

class CustomTheme {
  static ThemeData myTheme(BuildContext context) {
    return ThemeData(
      fontFamily: 'Urbanist',
      scaffoldBackgroundColor: colorBackground,
      appBarTheme: const AppBarTheme(
        color: colorBackground,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: colorIcon,
        ),
      ),
      primarySwatch: materialColor(colorPrimary),
      primaryColor: colorPrimary,
      iconTheme: const IconThemeData(
        color: colorPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(GoogleFonts.urbanist(
            color: colorTextButton,
          )),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadiusCircular,
            ),
          ),
        ),
      ),
      textTheme: GoogleFonts.urbanistTextTheme(
        myTextTheme.apply(
          bodyColor: colorText,
          displayColor: colorText,
        ),
      ),
      cardTheme: CardTheme(
        shape: roundedShape,
      ),
    );
  }
}

TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.urbanist(
    fontSize: 92,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.urbanist(
    fontSize: 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: GoogleFonts.urbanist(
    fontSize: 46,
    fontWeight: FontWeight.w400,
  ),
  headline4: GoogleFonts.urbanist(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headline5: GoogleFonts.urbanist(
    fontSize: 23,
    fontWeight: FontWeight.w400,
  ),

  //for header in each page
  headline6: GoogleFonts.urbanist(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
    color: colorPrimary,
  ),

  subtitle1: GoogleFonts.urbanist(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: GoogleFonts.urbanist(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyText1: GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  ),
  bodyText2: GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  button: GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  caption: GoogleFonts.urbanist(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  ),
  overline: GoogleFonts.urbanist(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);

final roundedShape = RoundedRectangleBorder(
  borderRadius: borderRadiusCircular,
);

final borderRadiusCircular = BorderRadius.circular(8);
