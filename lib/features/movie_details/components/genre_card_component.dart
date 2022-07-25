import 'package:flutter/material.dart';

import '../../../core/models/genre.dart';
import '../../../core/values/values.dart';

class GenreCardComponent extends StatelessWidget {
  const GenreCardComponent({
    Key? key,
    required this.genres,
  }) : super(key: key);

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 8.0,
        runSpacing: 4.0,
        children: genres.map((element) {
          return Container(
            height: 30,
            constraints: BoxConstraints(
              minWidth: size.width * .15,
              maxWidth: size.width * .25,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 10.0,
            ),
            alignment: Alignment.center,
            decoration: AppDecorations.genreCardComponent,
            child: Text(
              element.name.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.genreCardTitleStyle,
            ),
          );
        }).toList(),
      ),
    );
  }
}
