import 'package:flutter/material.dart';
import 'package:search_movies/features/home/components/genre_card_component.dart';

import '../../../core/models/genre.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({
    Key? key,
    required this.genres,
    this.onChangedCategory,
  }) : super(key: key);

  final List<Genre> genres;
  final VoidCallback? onChangedCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      child: ListView.builder(
        itemCount: 5,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          var genre = genres[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CategoryCardComponent(
              name: genre.name,
            ),
          );
        },
      ),
    );
  }
}
