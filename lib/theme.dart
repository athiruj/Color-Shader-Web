import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      headlineLarge: TextStyle(
        color: headlineLargeColor ?? _color,
        fontSize: 36,
        fontWeight: FontWeight.w900,
        fontFamily: _fontFamily
      ),
      headlineMedium: TextStyle(
        color: headlineSmall2Color ?? _color,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        fontFamily: _fontFamily
      ),
      headlineSmall: TextStyle(
        color: headlineSmall3Color ?? _subColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: _fontFamily
      ),
      titleMedium: TextStyle(
        color: titleMediumColor ?? _color,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: _fontFamily
      ),
      titleSmall: TextStyle(
        color: titleSmallColor ?? _color,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamily
      ),
      bodyLarge: TextStyle(
        color: bodyLargeColor ?? _subColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamily
      ),
      bodyMedium: TextStyle(
        color: bodyMediumColor ?? _subColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamily
      ),
      labelLarge: TextStyle(
        color: labelLargeColor ?? _subColor,
        fontSize: 23,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamily
      )
      );
      
        
  static const Color _color = Color(0xff1A1A1A);
  static const Color _subColor = Color(0xffB6B6B6);
  static final String? _fontFamily = GoogleFonts.openSans().fontFamily;
  final Color? headlineLargeColor;
  final Color? headlineSmall2Color;
  final Color? headlineSmall3Color;
  final Color? titleMediumColor;
  final Color? titleSmallColor;
  final Color? bodyLargeColor;
  final Color? bodyMediumColor;
  final Color? labelLargeColor;
}
