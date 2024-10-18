import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/themes/app_colors.dart';

class MoniepointAppTheme {
  static ThemeData lightTheme = moniePointlightTheme;
}

ThemeData moniePointlightTheme = ThemeData(

  scaffoldBackgroundColor: MoniepointColor.whiteColor,
  cardColor: MoniepointColor.whiteColor,
  fontFamily: GoogleFonts.manrope.toString(),
  primaryColor: MoniepointColor.primaryColor,
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: MoniepointColor.primaryColor,
      onPrimary: MoniepointColor.whiteColor,
      primaryContainer: MoniepointColor.primaryContainerLightColor,
      secondary: MoniepointColor.secondary,
      secondaryContainer: MoniepointColor.secondaryContainer,
      onSecondary: MoniepointColor.blackColor,
      tertiary: MoniepointColor.tertiary,
      onError: MoniepointColor.redColor,
      surface: MoniepointColor.whiteColor,
      onSurface: MoniepointColor.blackColor,
      error: MoniepointColor.redColor),
);
 