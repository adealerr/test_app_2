import 'package:dio/dio.dart';

/// Провайдер Dio с настройками.
class DioProvider {
  static const _timeout = 30 * 1000;

  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  Dio get() {
    return Dio()
      ..options = BaseOptions(
        connectTimeout: _timeout,
        sendTimeout: _timeout,
        receiveTimeout: _timeout,
        baseUrl: _baseUrl,
      );
  }
}
