import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get headerTitleStyle => _headerTitleStyle;
  static TextStyle get movieCardTitleStyle => _movieCardTitleStyle;
  static TextStyle get movieCardSubtitleStyle => _movieCardSubtitleStyle;

  static TextStyle get movieTitleStyle => _movieTitleStyle;
  static TextStyle get voteAverageStyle => _voteAverageStyle;
  static TextStyle get movieOriginalTitleStyle => _movieOriginalTitleStyle;

  static TextStyle get textSpanCardStyle => _textSpanCardStyle;
  static TextStyle get movieOverviewStyle => _movieOverviewStyle;
  static TextStyle get genreCardTitleStyle => _genreCardTitleStyle;

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

  // Movie details
  static final TextStyle _voteAverageStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppColors.voteAverageColor,
  );

  static final TextStyle _movieTitleStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: AppColors.movieTitleColor,
  );

  static final _movieOriginalTitleStyle = _movieTitleStyle.copyWith(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    color: AppColors.movieOriginalTitleColor,
  );

  static final TextStyle _movieOverviewStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.overviewTitleColor,
  );

  static final TextStyle _textSpanCardStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textSpanTitleColor,
  );

  static final _genreCardTitleStyle = _movieCardTitleStyle.copyWith(
    color: AppColors.overviewTitleColor,
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
