import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThisTheme {
  const ThisTheme(_);
        
  static const Color color = Color.fromARGB(255, 42, 42, 42);
  static const Color subColor = Color(0xffB6B6B6);
  static final String? fontFamily = GoogleFonts.openSans().fontFamily;
  
  static final TextTheme textTheme  = ThisTextTheme();
}
class ThisTextTheme extends TextTheme {
  ThisTextTheme(
      {
      this.headlineLargeColor,
      this.headlineSmall2Color,
      this.headlineSmall3Color,
      this.titleMediumColor,
      this.titleSmallColor,
      this.bodyLargeColor,
      this.bodyMediumColor,
      this.labelLargeColor,}) : 
      super(
      headlineLarge: GoogleFonts.openSans(
        color: headlineLargeColor ?? color,
        fontSize: 28,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: GoogleFonts.openSans(
        color: headlineSmall2Color ?? color,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: GoogleFonts.openSans(
        color: headlineSmall3Color ?? subColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.openSans(
        color: titleMediumColor ?? color,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: GoogleFonts.openSans(
        color: titleSmallColor ?? color,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.openSans(
        color: bodyLargeColor ?? subColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.openSans(
        color: bodyMediumColor ?? subColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      labelLarge: GoogleFonts.openSans(
        color: labelLargeColor ?? subColor,
        fontSize: 23,
        fontWeight: FontWeight.w600,
      )
      );
      
        
  static Color color = const Color.fromARGB(255, 42, 42, 42);
  static Color subColor = const Color(0xffB6B6B6);
  final Color? headlineLargeColor;
  final Color? headlineSmall2Color;
  final Color? headlineSmall3Color;
  final Color? titleMediumColor;
  final Color? titleSmallColor;
  final Color? bodyLargeColor;
  final Color? bodyMediumColor;
  final Color? labelLargeColor;
}
