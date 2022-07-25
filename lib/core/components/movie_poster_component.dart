import 'package:flutter/material.dart';

import '../values/values.dart';

class MoviePosterComponent extends StatelessWidget {
  const MoviePosterComponent({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.decoration,
    required this.image,
    this.fit = BoxFit.fill,
  }) : super(key: key);

  final Widget? child;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Decoration? decoration;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 16.0),
      child: Container(
        height: height ?? size.height * 0.6,
        width: width ?? size.width,
        alignment: Alignment.bottomCenter,
        decoration: decoration ??
            AppDecorations.moviePosterDecoration(
              image: DecorationImage(image: image, fit: fit),
            ),
        child: child,
      ),
    );
  }
}
