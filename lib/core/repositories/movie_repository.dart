import 'package:dio/dio.dart';
import 'package:search_movies/core/client/api_client.dart';
import 'package:search_movies/core/models/movie_response.dart';

abstract class MovieRepository {
  Future<MovieResponse> getMovies();
}

class MovieRepositoryImpl implements MovieRepository {
  final ApiClient _apiClient;

  MovieRepositoryImpl(this._apiClient);

  @override
  Future<MovieResponse> getMovies() async {
    try {
      final response = await _apiClient.instance.get('/movie/upcoming');

      return MovieResponse.fromMap(response.data);
    } on DioError catch (error) {
      throw Exception('Algo deu errado: $error');
    }
  }
}
