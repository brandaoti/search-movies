import 'package:flutter/material.dart';

class AppColors {
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _black = Color(0xFF000000);

  static const Color _grey1 = Color(0xFFF1F3F5);
  static const Color _grey2 = Color(0xFFE9ECEF);
  static const Color _grey3 = Color(0xFF868E96);
  static const Color _grey4 = Color(0xFF5E6770);
  static const Color _grey5 = Color(0xFF494E52);
  static const Color _grey6 = Color(0xFF343A40);
  static const Color _blueGrey = Color(0xFF00384C);

  static Color get iconColor => _grey4;
  static Color get backgroundColor => _white;
  static Color get linerGradientColor => _black;

  // Header
  static Color get headerTitleColor => _grey6;
  static Color get headerGenresBorderColor => _grey2;
  static Color get headerSearchMoviesHintColor => _grey4;
  static Color get headerSearchMoviesFilledColor => _grey1;

  // Movie Card
  static Color get movieCardTitleColor => _white;

  static Color get shadowColor => _blueGrey;

  static final headerGenresSelectedBackgroundColor = {
    'selected': _blueGrey,
    'unselected': _white,
  };
}