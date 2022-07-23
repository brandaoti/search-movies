import 'package:flutter/material.dart';
import 'package:search_movies/core/values/app_decorations.dart';

class MoviePosterComponent extends StatelessWidget {
  const MoviePosterComponent({
    Key? key,
    this.child,
    this.height,
    this.decoration,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;
  final Widget? child;
  final double? height;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 16.0),
      child: Container(
        height: height ?? size.height * 0.6,
        alignment: Alignment.bottomCenter,
        decoration: decoration ??
            AppDecorations.moviePosterDecoration(
              image: NetworkImage(imageUrl),
            ),
        child: child,
      ),
    );
  }
}
