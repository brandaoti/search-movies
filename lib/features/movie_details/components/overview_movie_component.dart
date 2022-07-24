import 'package:flutter/material.dart';

import '../../../core/values/values.dart';

class OverviewMovieComponent extends StatelessWidget {
  const OverviewMovieComponent({
    Key? key,
    this.width,
    required this.overview,
  }) : super(key: key);

  final double? width;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.movieOverview,
            textAlign: TextAlign.left,
            style: AppTextStyles.movieOverviewStyle,
          ),
          const SizedBox(height: 8.0),
          Text(
            overview,
            textAlign: TextAlign.left,
            style: AppTextStyles.movieOverviewStyle.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: AppColors.movieOverviewColor,
            ),
          ),
        ],
      ),
    );
  }
}
