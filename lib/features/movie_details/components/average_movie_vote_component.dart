import 'package:flutter/material.dart';

import '../../../core/values/values.dart';

class AverageMovieVoteComponent extends StatelessWidget {
  const AverageMovieVoteComponent({
    Key? key,
    required this.voteAverage,
  }) : super(key: key);

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: voteAverage.toStringAsPrecision(2),
          style: AppTextStyles.voteAverageStyle,
          children: [
            TextSpan(
              text: ' /10',
              style: AppTextStyles.voteAverageStyle.copyWith(
                fontSize: 14.0,
                color: AppColors.averageMaxColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
