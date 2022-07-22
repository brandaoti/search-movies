import 'package:flutter/material.dart';

class CategoryCardComponent extends StatelessWidget {
  const CategoryCardComponent({
    Key? key,
    this.onTap,
    required this.name,
    this.isSelected = false,
  }) : super(key: key);

  final String name;
  final VoidCallback? onTap;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final selectedBorder =
        isSelected ? null : Border.all(color: const Color(0xFFF1F3F5));

    final selectedColor = isSelected ? const Color(0xFF00384C) : Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: selectedColor,
          border: selectedBorder,
          borderRadius: BorderRadius.circular(26.0),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.white : const Color(0xFF00384C),
          ),
        ),
      ),
    );
  }
}
