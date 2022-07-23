import 'package:dio/dio.dart';

import 'services/api_path_settings.dart';

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
        queryParameters: {
          'language': 'pt-BR',
          'api_key': ApiPathSettings.API_KEY,
        },
      ),
    );
  }
}
