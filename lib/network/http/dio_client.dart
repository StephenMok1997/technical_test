import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:logger/logger.dart';
import 'package:technical_test/network/http/dio_config.dart';

class DioClient {
  DioClient({
    required this.config,
  });

  Dio _dio = Dio();
  final DioConfig config;
  final Logger logger = Logger();

  void setDio(Dio dio) {
    _dio = dio;
  }

  Dio get instance => _dio;

  void init() {
    _dio.options.baseUrl = config.baseUrl;
    _dio.options.connectTimeout = config.connectTimeout;
    _dio.options.sendTimeout = config.sendTimeout;
    _dio.options.receiveTimeout = config.receiveTimeout;
    _dio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    });

    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          _logDioRequest(options);
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logDioResponse(response);
          return handler.next(response);
        },
        onError: (DioException dioException, handler) {
          _logDioException(dioException);

          return handler.next(dioException);
        },
      ),
    );
  }

  void _logDioRequest(RequestOptions options) {
    logger.d(
      '*** Request ***\n'
      'uri: ${options.uri}\n'
      'method: ${options.method}\n'
      'headers: ${options.headers}\n'
      'params: ${options.queryParameters}\n'
      'data: ${options.data}',
    );
  }

  void _logDioResponse(Response<dynamic> response) {
    logger.d(
      '*** Response ***\n'
      'uri: ${response.realUri}\n'
      'statusCode: ${response.statusCode}\n'
      'data: ${response.data}',
    );
  }

  void _logDioException(DioException exception) {
    logger.e(
      '*** Error ***\n${exception.toString()}',
    );
  }
}
