import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThisTheme {
  const ThisTheme(_);

  static const Color primaryColor = Color(0xFF1A1A1A);
  static const Color secondaryColor = Color(0xFF5A5A5A);
  static const Color supColor = Color(0xFFF4F4F4);
  static final String? fontFamily = GoogleFonts.openSans().fontFamily;

  static final TextTheme textTheme = TextTheme(
    // headlineSmall: GoogleFonts.lobster(
    //   color: primaryColor,
    //   fontSize: 28.0,
    //   fontWeight: FontWeight.w400,
    // ),
    titleMedium: GoogleFonts.openSans(
      color: primaryColor,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: GoogleFonts.openSans(
      color: primaryColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: GoogleFonts.comfortaa(
      color: primaryColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: GoogleFonts.openSans(
      color: secondaryColor,
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: GoogleFonts.openSans(
      color: primaryColor,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
  );
  static SliderThemeData sliderTheme = SliderThemeData(
    trackHeight: 4.0,
    
    overlayColor: primaryColor.withOpacity(0.3),
    overlappingShapeStrokeColor: Colors.white,
    valueIndicatorColor: primaryColor,
    thumbColor: primaryColor,
    activeTrackColor: primaryColor,
    activeTickMarkColor: primaryColor,
    inactiveTrackColor: supColor,
    inactiveTickMarkColor: Colors.transparent,
    // disabledThumbColor: primaryColor,
    // disabledActiveTrackColor: primaryColor,
    // disabledActiveTickMarkColor: primaryColor,
    // disabledInactiveTrackColor: primaryColor,
    // disabledInactiveTickMarkColor: primaryColor,
    overlayShape: const RoundSliderOverlayShape(
      overlayRadius: 12.0,
    ),
    thumbShape:
        const RoundSliderThumbShape(enabledThumbRadius: 10.0),
    trackShape: const RoundedRectSliderTrackShape(),
    rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
  );
}

// class ThisTextTheme extends TextTheme {
//   ThisTextTheme({
//     this.headlineLargeColor,
//     this.headlineSmall2Color,
//     this.headlineSmall3Color,
//     this.titleMediumColor,
//     this.titleSmallColor,
//     this.bodyLargeColor,
//     this.bodyMediumColor,
//     this.labelLargeColor,
//   }) : super(
//             headlineLarge: GoogleFonts.openSans(
//               color: headlineLargeColor ?? color,
//               fontSize: 28,
//               fontWeight: FontWeight.w800,
//             ),
//             headlineMedium: GoogleFonts.openSans(
//               color: headlineSmall2Color ?? color,
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//             headlineSmall: GoogleFonts.openSans(
//               color: headlineSmall3Color ?? subColor,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//             titleMedium: GoogleFonts.openSans(
//               color: titleMediumColor ?? color,
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//             titleSmall: GoogleFonts.openSans(
//               color: titleSmallColor ?? color,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//             bodyLarge: GoogleFonts.openSans(
//               color: bodyLargeColor ?? subColor,
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//             bodyMedium: GoogleFonts.openSans(
//               color: bodyMediumColor ?? subColor,
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//             labelLarge: GoogleFonts.openSans(
//               color: labelLargeColor ?? subColor,
//               fontSize: 23,
//               fontWeight: FontWeight.w600,
//             ));

//   static Color color = const Color.fromARGB(255, 42, 42, 42);
//   static Color subColor = const Color(0xffB6B6B6);
//   final Color? headlineLargeColor;
//   final Color? headlineSmall2Color;
//   final Color? headlineSmall3Color;
//   final Color? titleMediumColor;
//   final Color? titleSmallColor;
//   final Color? bodyLargeColor;
//   final Color? bodyMediumColor;
//   final Color? labelLargeColor;
// }
