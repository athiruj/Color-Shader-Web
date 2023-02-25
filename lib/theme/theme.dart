import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThisTheme {
  const ThisTheme(_);

  static const Color primary = Color(0xFF1A1A1A);
  static const Color onPrimary = Color(0xffEAEAEA);
  static const Color primaryContainer = Color(0xFF717171);
  static const Color onPrimaryContainer = primary;
  static const Color secondary = primary;
  static const Color onSecondary = onPrimary;
  static const Color error = Color(0xFF960000);
  static const Color onError = Colors.white;
  static const Color background = Color(0xCCFFFFFF);
  static const Color onBackground = Color(0xFF000000);
  static const Color surface = onPrimary;
  static const Color onSurface = onBackground;
  static final String? fontFamily = GoogleFonts.openSans().fontFamily;

  static const ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: onError,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface);

  static final TextTheme textTheme = TextTheme(
    titleMedium: GoogleFonts.openSans(
      color: primary,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: GoogleFonts.openSans(
      color: primary.withOpacity(0.38),
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: GoogleFonts.openSans(
      color: primary,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: GoogleFonts.comfortaa(
      color: primary,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: GoogleFonts.openSans(
      color: primaryContainer,
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: GoogleFonts.openSans(
      color: primary,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
  );
  static SliderThemeData sliderTheme = const SliderThemeData(
    trackHeight: 4.0,
    inactiveTickMarkColor: Colors.transparent,
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 12.0,
    ),
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
    trackShape: RoundedRectSliderTrackShape(),
    rangeTrackShape: RoundedRectRangeSliderTrackShape(),
  );

  static const CheckboxThemeData checkboxTheme = CheckboxThemeData(
    shape: CircleBorder(),
    splashRadius: 10,
  );

  static TabBarTheme tabBarTheme = TabBarTheme(
    indicator: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      color: primary,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Colors.white,
    labelPadding: EdgeInsets.zero,
    labelStyle: ThisTheme.textTheme.bodyLarge,
    overlayColor: MaterialStateProperty.resolveWith((states) {
      return ThisTheme.primary.withOpacity(0.38);
    }),
    unselectedLabelColor: ThisTheme.primary,
    unselectedLabelStyle: ThisTheme.textTheme.bodyLarge,
  );
}
