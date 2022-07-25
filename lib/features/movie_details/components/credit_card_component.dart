import 'package:flutter/material.dart';

import '../../../core/values/values.dart';

class CreditCardComponent extends StatelessWidget {
  const CreditCardComponent({
    Key? key,
    this.width,
    required this.title,
    required this.description,
  }) : super(key: key);

  final double? width;
  final String title;
  final String description;

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
            title,
            textAlign: TextAlign.left,
            style: AppTextStyles.movieOverviewStyle,
          ),
          const SizedBox(height: 8.0),
          Text(
            description.isEmpty
                ? AppStrings.unavailable
                : description.replaceAll('(', '').replaceAll(')', ''),
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
