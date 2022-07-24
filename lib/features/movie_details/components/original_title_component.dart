import 'package:flutter/material.dart';

import '../../../core/models/movie_details.dart';
import '../../../core/values/values.dart';

class OriginalTitleComponent extends StatelessWidget {
  final MovieDetails movieDetails;

  const OriginalTitleComponent({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          movieDetails.title.toUpperCase(),
          style: AppTextStyles.movieTitleStyle,
        ),
        const SizedBox(height: 12.0),
        RichText(
          text: TextSpan(
            text: AppStrings.movieOriginalTitle,
            style: AppTextStyles.movieOriginalTitleStyle,
            children: [
              TextSpan(
                text: movieDetails.originalTitle,
                style: AppTextStyles.movieOriginalTitleStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
