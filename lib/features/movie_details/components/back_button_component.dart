import 'package:flutter/material.dart';
import 'package:search_movies/core/values/app_strings.dart';

import '../../../core/values/values.dart';

class BackButtonComponent extends StatelessWidget {
  const BackButtonComponent({
    Key? key,
    this.width,
    this.height,
    this.onPressed,
  }) : super(key: key);

  final double? width;
  final double? height;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
      child: Container(
        width: width ?? 80.0,
        height: height ?? 32.0,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: -10,
              offset: Offset(0, 10),
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              size: 10.0,
              Icons.arrow_back_ios,
              color: AppColors.iconColor,
            ),
            const SizedBox(width: 4.0),
            Text(
              AppStrings.backButton,
              style: AppTextStyles.backButtonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
