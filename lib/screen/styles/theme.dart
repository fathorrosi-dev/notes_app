import 'package:notes_app/screen/styles/card_themes.dart';
import 'package:notes_app/screen/styles/input_themes.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/screen/styles/elevated_button_themes.dart';
import 'package:notes_app/screen/styles/text_themes.dart';
import 'package:notes_app/screen/utils/constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(primary: AppColors.primary),
    scaffoldBackgroundColor: AppColors.light,
    textTheme: TextThemes.lightTextTheme.apply(
      displayColor: AppColors.darkTextPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemes.lightElevatedButtonThemeData,
    inputDecorationTheme: InputThemes.lightInputDecorationThemeData,
    cardTheme: CardThemes.lightThemeData,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(primary: AppColors.primary),
    scaffoldBackgroundColor: AppColors.dark,
    textTheme: TextThemes.darkTextTheme.apply(
      displayColor: AppColors.lightTextPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemes.darkElevatedButtonThemeData,
    inputDecorationTheme: InputThemes.darkInputDecorationThemeData,
    cardTheme: CardThemes.darkThemeData,
  );
}
