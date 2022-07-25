import 'package:flutter/material.dart';

import '../values/values.dart';

class WarningComponent extends StatelessWidget {
  const WarningComponent({
    Key? key,
    this.onRefresh,
    this.child,
  }) : super(key: key);

  final VoidCallback? onRefresh;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRefresh,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Verifique sua conexão!!!',
              textAlign: TextAlign.center,
              style: AppTextStyles.textSpanCardStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textSpanSubtitleColor,
              ),
            ),
            Text(
              'Clique na tela para tente novamente!',
              textAlign: TextAlign.center,
              style: AppTextStyles.textSpanCardStyle.copyWith(
                fontSize: 14.0,
                color: AppColors.textSpanSubtitleColor,
              ),
            ),
            const SizedBox(height: 50),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
