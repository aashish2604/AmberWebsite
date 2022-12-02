import 'package:amber_website/services/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
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
