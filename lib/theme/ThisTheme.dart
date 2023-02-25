import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThisTheme {
  const ThisTheme(_);

  static const Color primary = Color(0xFF1A1A1A);
  static const Color onPrimary = Colors.white;
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
    // headlineSmall: GoogleFonts.lobster(
    //   color: primary,
    //   fontSize: 28.0,
    //   fontWeight: FontWeight.w400,
    // ),
    titleMedium: GoogleFonts.openSans(
      color: primary,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      // letterSpacing: 0.8,
      // wordSpacing: 0.5
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
    // overlayColor: primary.withOpacity(0.3),
    // overlappingShapeStrokeColor: Colors.white,
    // valueIndicatorColor: primary,
    // thumbColor: primary,
    // activeTrackColor: primary,
    // activeTickMarkColor: primary,
    // inactiveTrackColor: supColor,
    inactiveTickMarkColor: Colors.transparent,
    // disabledThumbColor: primary,
    // disabledActiveTrackColor: primary,
    // disabledActiveTickMarkColor: primary,
    // disabledInactiveTrackColor: primary,
    // disabledInactiveTickMarkColor: primary,
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 12.0,
    ),
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
    trackShape: RoundedRectSliderTrackShape(),
    rangeTrackShape: RoundedRectRangeSliderTrackShape(),
  );

  static const CheckboxThemeData checkboxTheme = CheckboxThemeData(
    // activeColor: ThisTheme.color,
    shape: CircleBorder(),
    splashRadius: 10,
    // fillColor: MaterialStateProperty.all(ThisTheme.primaryColor),
    // checkColor: MaterialStateProperty.all(Colors.white),
    // side: const BorderSide(color: ThisTheme.supColor, width: 2)
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
    // mouseCursor: ,
    overlayColor: MaterialStateProperty.resolveWith((states) {
      return ThisTheme.primary.withOpacity(0.38);
    }),
    // splashFactory: ,
    unselectedLabelColor: ThisTheme.primary,
    unselectedLabelStyle: ThisTheme.textTheme.bodyLarge,
  );
}

// class ThisTabColorState extends MaterialStateProperty<Color> {
//   const ThisTabColorState() : super(_defaultColor);

//   static const int _defaultColor = 0x00000000;
//   static const int _pressedColor = 0x08000000;

//   @override
//   Color resolve(Set<MaterialState> states) {
//     if (states.contains(MaterialState.pressed)) {
//       return const Color(_pressedColor);
//     }
//     if (states.contains(MaterialState.selected)) {
//       return const Color(0xff000000);
//     }
//     return const Color(_defaultColor);
//   }
// }
