import 'package:search_movies/core/models/movie_model.dart';

class MovieResponse {
  final List<MovieModel> movies;

  MovieResponse({
    required this.movies,
  });

  factory MovieResponse.fromMap(Map<String, dynamic> json) {
    return MovieResponse(
      movies: (json['results'] as List)
          .map((movie) => MovieModel.fromMap(movie))
          .toList(),
    );
  }
}
