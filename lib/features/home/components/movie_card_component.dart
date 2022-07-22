import 'package:flutter/material.dart';
import 'package:search_movies/core/client/services/api_path_settings.dart';
import 'package:search_movies/core/components/linear_gradient_component.dart';
import 'package:search_movies/core/components/movie_poster_component.dart';
import 'package:search_movies/core/models/movie.dart';

class MovieCardComponent extends StatelessWidget {
  const MovieCardComponent({
    Key? key,
    this.child,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MoviePosterComponent(
      imageUrl: ApiPathSettings.REQUEST_IMG(movie.posterPath),
      child: LinearGradientComponent(
        width: double.infinity,
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              movie.genresName!.join(' - '),
              style: const TextStyle(
                fontSize: 10.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
