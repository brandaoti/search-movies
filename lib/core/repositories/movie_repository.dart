import 'package:dio/dio.dart';

import '../client/client.dart';
import '../models/genre.dart';
import '../models/movie.dart';

abstract class MovieRepository {
  Future<List<Genre>> getGenre();
  Future<List<Movie>> getMovies();
  Future<List<Movie>> searchMovies(String search);
}

class MovieRepositoryImpl implements MovieRepository {
  final ApiClient _apiClient;

  MovieRepositoryImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await _apiClient.instance.get('/movie/popular');

      return (response.data['results'] as List)
          .map((movie) => Movie.fromMap(movie))
          .toList();
    } on DioError catch (error) {
      throw Exception('Algo deu errado: $error');
    }
  }

  @override
  Future<List<Genre>> getGenre() async {
    final response = await _apiClient.instance.get('/genre/movie/list');

    return (response.data['genres'] as List)
        .map((genre) => Genre.fromMap(genre))
        .toList();
  }

  @override
  Future<List<Movie>> searchMovies(String search) async {
    try {
      final response = await _apiClient.instance.get(
        '/search/movie',
        queryParameters: {'query': search},
      );

      return (response.data['results'] as List)
          .map((movie) => Movie.fromMap(movie))
          .toList();
    } on DioError catch (error) {
      throw Exception('Algo deu errado: $error');
    }
  }
}
