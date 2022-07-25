import 'package:flutter/material.dart';
import 'package:search_movies/features/movie_details/movie_details_screen.dart';

import '../../../core/client/services/api_path_settings.dart';
import '../../../core/components/components.dart';
import '../../../core/models/models.dart';
import '../../../core/values/values.dart';

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
      image: NetworkImage(
        ApiPathSettings.REQUEST_IMG(movie.posterPath),
      ),
      child: LinearGradientComponent(
        width: double.infinity,
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: AppTextStyles.movieCardTitleStyle,
            ),
            const SizedBox(height: 12.0),
            Text(
              movie.genresName?.join(' - ') ?? AppStrings.genreUnavailable,
              style: AppTextStyles.movieCardSubtitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
