import 'package:flutter/material.dart';

import '../../../core/values/values.dart';

class HeaderGenreCardItemComponent extends StatelessWidget {
  const HeaderGenreCardItemComponent({
    Key? key,
    this.onTap,
    this.height,
    required this.name,
    this.isSelected = false,
  }) : super(key: key);

  final String name;
  final VoidCallback? onTap;

  final double? height;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 30.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        decoration: AppDecorations.headerGenreDecoration(
            isSelectedDecoration: isSelected),
        child: Text(
          name,
          style: AppTextStyles.headerGenreStyle(isSelectedColor: isSelected),
        ),
      ),
    );
  }
}
