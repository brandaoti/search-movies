import 'package:flutter/material.dart';

class LinearGradientComponent extends StatelessWidget {
  const LinearGradientComponent({
    Key? key,
    this.width,
    this.child,
    this.alignment,
    this.left = 24.0,
    this.bottom = 32.0,
    this.height = 162.0,
  }) : super(key: key);

  final double left;
  final double bottom;
  final double? width;
  final double? height;

  final Widget? child;

  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(left: left, bottom: bottom),
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.01),
              Colors.black.withOpacity(0.63),
              Colors.black.withOpacity(1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.7, 0.9]),
      ),
      child: child,
    );
  }
}
