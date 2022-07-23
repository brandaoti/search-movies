import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get headerTitleStyle => _headerTitleStyle;
  static TextStyle get movieCardTitleStyle => _movieCardTitleStyle;
  static TextStyle get movieCardSubtitleStyle => _movieCardSubtitleStyle;

  static const _headerTitleStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static final _movieCardTitleStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: AppColors.movieCardTitleColor,
  );

  static final _movieCardSubtitleStyle = _movieCardTitleStyle.copyWith(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle headerGenreStyle({required bool isSelectedColor}) {
    return TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: isSelectedColor
          ? AppColors.headerGenresSelectedBackgroundColor['unselected']
          : AppColors.headerGenresSelectedBackgroundColor['selected'],
    );
  }
}
