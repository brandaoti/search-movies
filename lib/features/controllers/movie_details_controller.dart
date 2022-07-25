import 'package:flutter/material.dart';

import '../../core/repositories/movie_repository.dart';
import '../states/movie_details_states.dart';

class MovieDetailsController extends ValueNotifier<MovieDetailsStates> {
  final MovieRepository _repository;

  MovieDetailsController({required MovieRepository repository})
      : _repository = repository,
        super(MovieDetailsInitial());

  getMovieDetails(int id) async {
    value = MovieDetailsLoaging();

    try {
      final movieDetails = await _repository.getMovieDetails(id);
      value = MovieDetailsLoaded(movieDetails: movieDetails);
    } catch (error) {
      value = MovieDetailsError(message: error.toString());
    }
  }
}
