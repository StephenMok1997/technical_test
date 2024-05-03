import 'package:dio/dio.dart';
import 'package:technical_test/network/http/dio_client.dart';
import 'package:technical_test/network/http/dio_config.dart';

class HttpClient {
  static late Dio dio;

  static void initClient({
    required DioConfig config,
  }) {
    final DioClient dioClient = DioClient(
      config: config,
    )..init();
    dio = dioClient.instance;
  }
}
