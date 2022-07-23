import 'package:flutter/material.dart';

import '../values/values.dart';

abstract class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      inputDecorationTheme: _inputDecorationTheme(),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      border: AppDecorations.inputBorder,
      fillColor: AppColors.headerSearchMoviesFilledColor,
      enabledBorder: AppDecorations.inputBorder,
      focusedBorder: AppDecorations.inputBorder,
      constraints: const BoxConstraints(minHeight: 48.0),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    );
  }
}
