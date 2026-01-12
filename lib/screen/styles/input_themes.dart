import 'package:notes_app/screen/styles/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/screen/utils/constants/colors.dart';

class InputThemes {
  InputThemes._();

  static final InputDecorationTheme lightInputDecorationThemeData =
      InputDecorationTheme(
        hintStyle: TextThemes.lightTextTheme.bodyMedium!.copyWith(
          color: AppColors.lightTextSecondary,
        ),
        hintFadeDuration: const Duration(milliseconds: 700),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
      );

  static final InputDecorationTheme darkInputDecorationThemeData =
      InputDecorationTheme(
        hintStyle: TextThemes.darkTextTheme.bodyMedium!.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        hintFadeDuration: const Duration(milliseconds: 700),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 10.0,
        ),
      );
}
