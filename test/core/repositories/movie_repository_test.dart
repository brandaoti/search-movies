import 'package:flutter_test/flutter_test.dart';
import 'package:search_movies/core/client/api_client.dart';
import 'package:search_movies/core/repositories/movie_repository.dart';

void main() {
  final repository = MovieRepositoryImpl(apiClient: ApiClientImpl());

  test('Get Movies', () async {
    var response = await repository.getMovies();

    expect(response, isNotNull);
  });
}
