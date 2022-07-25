import 'package:flutter/material.dart';

import '../../../core/models/genre.dart';
import 'header_genre_card_component.dart';

class HeaderGenreItemComponent extends StatefulWidget {
  const HeaderGenreItemComponent({
    Key? key,
    this.height,
    required this.genres,
    required this.onChangedGenre,
  }) : super(key: key);

  final List<Genre> genres;
  final ValueChanged<int> onChangedGenre;

  final double? height;

  @override
  State<HeaderGenreItemComponent> createState() =>
      _HeaderGenreItemComponentState();
}

class _HeaderGenreItemComponentState extends State<HeaderGenreItemComponent> {
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
        itemCount: 4,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final genre = widget.genres[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: HeaderGenreCardComponent(
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
