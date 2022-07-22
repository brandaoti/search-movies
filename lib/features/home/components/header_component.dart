import 'package:flutter/material.dart';

import '../../../core/models/genre.dart';
import 'genre_item_component.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({
    Key? key,
    this.onChanged,
    required this.genres,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24.0),
          const Text(
            'Filmes',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24.0),
          TextFormField(
            onChanged: onChanged,
            decoration: const InputDecoration(
              filled: true,
              hintText: 'Pesquise filmes',
              prefixIcon: Icon(Icons.search, color: Color(0xFF5E6770)),
            ),
          ),
          const SizedBox(height: 16.0),

          // ! Category
          CategoriesComponent(
            genres: genres,
          ),

          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
