import 'package:flutter/material.dart';

import '../../../core/values/values.dart';

class TextSpanCardComponent extends StatelessWidget {
  const TextSpanCardComponent({
    Key? key,
    this.title,
    this.height,
    this.subtitle,
    this.alignment,
    this.titleStyle,
    this.subtitleStyle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final double? height;

  final AlignmentGeometry? alignment;

  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.textSpanCardBackgroundColor,
      ),
      alignment: alignment ?? Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      child: RichText(
        text: TextSpan(
          text: title,
          style: titleStyle ?? AppTextStyles.textSpanCardStyle,
          children: [
            TextSpan(
              text: subtitle,
              style: subtitleStyle ??
                  AppTextStyles.textSpanCardStyle.copyWith(
                    fontSize: 14.0,
                    color: AppColors.textSpanSubtitleColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
