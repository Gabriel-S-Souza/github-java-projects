import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      surfaceTint: AppColors.primaryVariant,
      secondary: AppColors.secondary,
      error: AppColors.error,
      background: AppColors.background,
      surface: AppColors.tertiary,
      tertiary: AppColors.secondary,
      onSurface: AppColors.secondary,
      onBackground: AppColors.grey,
      onPrimary: AppColors.greyLight,
      onError: AppColors.error,
      onSecondary: AppColors.greyLight,
    ),
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.secondary,
    ),
  );
}

class AppColors {
  static const Color primary = Color(0xFF3977AA);
  static const Color primaryVariant = Color(0xFF3977AA);
  static const Color secondary = Color(0xFF24292f);
  static const Color error = Color(0xFFF47853);
  static const Color background = Color(0xFFFFFFFF);
  static const Color tertiary = Color(0xFFE19305);
  static const Color grey = Color(0xFF6B6B6B);
  static const Color greyLight = Color(0xFFA4A4A4);
}
