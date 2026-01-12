import 'package:flutter/material.dart';
import 'package:notes_app/screen/utils/constants/colors.dart';

class CardThemes {
  CardThemes._();

  static final CardThemeData lightThemeData = CardThemeData(
    color: AppColors.lightSecondary,
    elevation: 0,
  );

  static final CardThemeData darkThemeData = CardThemeData(
    color: AppColors.darkSecondary,
    elevation: 0,
  );
}
