import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDecorations {
  static OutlineInputBorder get inputBorder => _inputBorder;

  static final _inputBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(100),
  );

  static BoxDecoration headerGenreDecoration({
    required bool isSelectedDecoration,
  }) {
    return BoxDecoration(
      color: isSelectedDecoration
          ? AppColors.headerGenresSelectedBackgroundColor['selected']
          : AppColors.headerGenresSelectedBackgroundColor['unselected'],
      border: isSelectedDecoration
          ? null
          : Border.all(color: AppColors.headerGenresBorderColor),
      borderRadius: BorderRadius.circular(26.0),
    );
  }

  static InputDecoration inputDecoration({bool? filled, String? hintText}) {
    return InputDecoration(
      filled: filled,
      hintText: hintText,
      prefixIcon: Icon(Icons.search, color: AppColors.iconColor),
    );
  }

  static BoxDecoration moviePosterDecoration({
    BoxFit fit = BoxFit.fill,
    required ImageProvider image,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      image: DecorationImage(
        fit: fit,
        image: image,
      ),
      boxShadow: const [
        BoxShadow(
          blurRadius: 20,
          spreadRadius: -10,
          offset: Offset(0, 20),
          color: Color.fromRGBO(0, 56, 76, 0.2),
        ),
      ],
    );
  }
}
