import '../../core/models/models.dart';

abstract class MovieStates {}

class MovieInitial implements MovieStates {}

class MovieLoaging implements MovieStates {}

class MovieLoaded implements MovieStates {
  final List<Movie> movies;
  final List<Genre> genres;

  MovieLoaded({required this.movies, required this.genres});
}

class MovieError implements MovieStates {
  final String message;

  MovieError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
