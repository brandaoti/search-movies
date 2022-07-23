import 'package:flutter/material.dart';

import '../../core/models/models.dart';
import '../../core/repositories/movie_repository.dart';
import '../states/movie_states.dart';

class MovieController extends ValueNotifier<MovieStates> {
  final MovieRepository _repository;

  MovieController({required MovieRepository repository})
      : _repository = repository,
        super(MovieInitial());

  final List<Movie> _movies = [];
  final List<Genre> _genres = [];

  Future<List<Movie>> loadMovies() async {
    value = MovieLoaging();

    final response = await _repository.getMovies();

    _movies.addAll(response);

    if (_movies.isEmpty || _genres.isEmpty) return _movies;

    try {
      for (var i = 0; i < _movies.length; i++) {
        List<String> tempGenre = [];

        for (int genre in _movies[i].genreIds) {
          var tempGenreName =
              _genres.firstWhere((element) => element.id == genre);

          tempGenre.add(tempGenreName.name);
        }

        var tempMovie = _movies[i].copyWith(genres: tempGenre);

        _movies[i] = tempMovie;
      }
      value = MovieLoaded(movies: _movies, genres: _genres);
    } catch (e) {
      value = MovieError(message: e.toString());
    }

    return _movies;
  }

  Future<List<Genre>> loadGenres() async {
    _genres.addAll(await _repository.getGenre());
    return _genres;
  }

  getMovieByCategory(int genreId) {
    final filteredMovies = _movies.where(
      (movie) {
        return movie.genreIds.contains(genreId);
      },
    ).toList();
    value = MovieLoaded(movies: filteredMovies, genres: _genres);
  }

  onSearchMovies(String searchMovie) async {
    final filterMovie = await _repository.searchMovies(searchMovie);

    value = MovieLoaded(movies: filterMovie, genres: _genres);
  }
}
