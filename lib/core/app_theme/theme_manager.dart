import 'package:e_commerceapp/core/app_theme/color_palette.dart';
import 'package:e_commerceapp/core/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

abstract class ThemeManager {

  ThemeData themeData = ThemeData(
    primaryColor: ColorPalette.mainColor,
    useMaterial3: true,
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: ColorPalette.whiteColor,
      ),
      titleLarge: TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ColorPalette.mainColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorPalette.whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontFamily: FontFamily.poppins,
        fontWeight: FontWeight.w300,
        color: ColorPalette.whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        fontFamily: FontFamily.poppins,
        color: ColorPalette.semiBlackColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        fontFamily: FontFamily.poppins,
        color: ColorPalette.descriptionColor
      ),
      bodySmall: TextStyle(fontSize: 12),
    ),
  );
}