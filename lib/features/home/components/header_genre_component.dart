import 'package:flutter/material.dart';

import '../../../core/models/genre.dart';
import 'header_genre_card_item_component.dart';

class HeaderGenreComponent extends StatefulWidget {
  const HeaderGenreComponent({
    Key? key,
    this.height,
    required this.genres,
    required this.onChangedGenre,
  }) : super(key: key);

  final List<Genre> genres;
  final ValueChanged<int> onChangedGenre;

  final double? height;

  @override
  State<HeaderGenreComponent> createState() => _HeaderGenreComponentState();
}

class _HeaderGenreComponentState extends State<HeaderGenreComponent> {
  var selectedGenre = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onChangedGenre(int index, {required int genreId}) {
    selectedGenre = index;
    widget.onChangedGenre.call(genreId);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: widget.height ?? size.height * .04,
      child: ListView.builder(
        itemCount: widget.genres.length,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final genre = widget.genres[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: HeaderGenreCardItemComponent(
              name: genre.name,
              isSelected: index == selectedGenre,
              onTap: () => _onChangedGenre(
                index,
                genreId: genre.id,
              ),
            ),
          );
        },
      ),
    );
  }
}
