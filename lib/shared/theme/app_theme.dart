import 'package:flutter/material.dart';
import 'package:cashflow/shared/theme/components_theme/buttons_theme.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.background,
    ),
    textTheme: TextTheme(headlineLarge: TextStyle(fontWeight: FontWeight.bold)),
    elevatedButtonTheme: ButtonsTheme.elevatedButtonLightTheme,
    appBarTheme: AppBarTheme(
      color: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.textSecondary),
      titleTextStyle: TextStyle(color: AppColors.textSecondary, fontSize: 20),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 30, color: AppColors.accent),
      unselectedIconTheme: IconThemeData(size: 30),
      unselectedLabelStyle: TextStyle(color: AppColors.textSecondary),
      selectedLabelStyle: TextStyle(color: AppColors.accent),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.accent,
      unselectedItemColor: AppColors.secondary,
      backgroundColor: AppColors.primary,
    ),
  );
}
