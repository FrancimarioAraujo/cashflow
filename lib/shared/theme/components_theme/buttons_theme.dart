import 'package:flutter/material.dart';
import 'package:cashflow/shared/theme/constants/app_border_radius.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';
import 'package:cashflow/shared/theme/constants/app_paddings.dart';

class ButtonsTheme {
  static ElevatedButtonThemeData
  elevatedButtonLightTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(AppColors.primary),
      foregroundColor: WidgetStateProperty.all<Color>(AppColors.textSecondary),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(AppPaddings.small),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: AppBorderRadius.small),
      ),
      elevation: WidgetStateProperty.all<double>(4),
      textStyle: WidgetStateProperty.all<TextStyle>(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
