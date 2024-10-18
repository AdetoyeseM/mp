import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/themes/app_colors.dart';

class AppStyles {
  // Text Styles
  static final TextStyle titleStyle = GoogleFonts.manrope(
    fontSize: 28,  // Large size for the title text (e.g., "let's select your perfect place")
    fontWeight: FontWeight.bold,
    color: MoniepointColor.primaryTextColor,
  );

  static final TextStyle greetingStyle = GoogleFonts.manrope(
    fontSize: 18,  // Font size for the greeting (e.g., "Hi, Marina")
    fontWeight: FontWeight.normal,
    color: MoniepointColor.secondaryTextColor,
  );

  static final TextStyle offersCountStyle = GoogleFonts.manrope(
    fontSize: 35,   
    fontWeight: FontWeight.bold,
    color: MoniepointColor.primaryColor,
  );

  static final TextStyle offerTypeStyle = GoogleFonts.manrope(
    fontSize: 16,   
    fontWeight: FontWeight.w600,
    color: MoniepointColor.offerTypeTextColor,
  );

  static final TextStyle addressStyle = GoogleFonts.manrope( 
    fontWeight: FontWeight.normal,
    color: MoniepointColor.secondaryTextColor,
  );
 
  static final TextStyle buttonTextStyle = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle locationStyle = GoogleFonts.manrope(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: MoniepointColor.secondaryTextColor,  
);
}
