import 'package:amber_website/services/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final titleTextStyle =
    GoogleFonts.gruppo(fontSize: 38.0, fontWeight: FontWeight.w800);

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: kCatsKillWhiteColor,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: kSmoothBlack,
          onPrimary: kCatsKillWhiteColor,
          secondary: kSmoothBlack,
          onSecondary: kCatsKillWhiteColor,
          error: kSadRed,
          onError: kWhiteColor,
          background: kCatsKillWhiteColor,
          onBackground: kSmoothBlack,
          surface: kCulturedWhiteColor,
          onSurface: kSmoothBlack),
    );
  }
}
