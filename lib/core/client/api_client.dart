import 'package:dio/dio.dart';

abstract class ApiClient {
  Dio get instance;
}

class ApiClientImpl implements ApiClient {
  late final Dio? _dio;

  @override
  Dio get instance => _dio!;

  ApiClientImpl() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        queryParameters: {'api_key': 'a84494faf90abbc9d3f6783cf036c2dd'},
      ),
    );
  }
}
