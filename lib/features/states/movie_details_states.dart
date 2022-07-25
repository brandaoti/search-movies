import 'package:search_movies/core/models/movie_details.dart';

abstract class MovieDetailsStates {}

class MovieDetailsInitial implements MovieDetailsStates {}

class MovieDetailsLoaging implements MovieDetailsStates {}

class MovieDetailsLoaded implements MovieDetailsStates {
  final MovieDetails movieDetails;

  MovieDetailsLoaded({required this.movieDetails});
}

class MovieDetailsError implements MovieDetailsStates {
  final String message;

  MovieDetailsError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDetailsError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
