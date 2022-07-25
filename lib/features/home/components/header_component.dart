import 'package:flutter/material.dart';

import '../../../core/models/models.dart';
import '../../../core/values/values.dart';
import 'header_genre_item_component.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({
    Key? key,
    required this.genres,
    required this.onSearchChanged,
    required this.onChangedGenre,
  }) : super(key: key);

  final List<Genre> genres;
  final Function(int) onChangedGenre;
  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24.0),
          Text(
            AppStrings.headerTitle,
            style: AppTextStyles.headerTitleStyle,
          ),
          const SizedBox(height: 24.0),
          TextFormField(
            onChanged: onSearchChanged,
            decoration: AppDecorations.inputDecoration(
              filled: true,
              hintText: AppStrings.headerSearchMovies,
            ),
          ),
          const SizedBox(height: 16.0),
          HeaderGenreItemComponent(
            genres: genres,
            onChangedGenre: onChangedGenre,
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
