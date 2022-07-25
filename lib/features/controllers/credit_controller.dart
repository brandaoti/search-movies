import 'package:flutter/material.dart';

import '../../core/repositories/movie_repository.dart';
import '../states/credit_states.dart';

class CreditController extends ValueNotifier<CreditStates> {
  final MovieRepository _repository;

  CreditController({required MovieRepository repository})
      : _repository = repository,
        super(CreditInitial());

  getMovieDetails(int id) async {
    value = CreditLoaging();

    try {
      final credit = await _repository.getCredits(id);
      value = CreditLoaded(credits: credit);
    } catch (error) {
      value = CreditError(message: error.toString());
    }
  }
}
