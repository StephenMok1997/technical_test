class DioConfig {
  DioConfig({
    required this.baseUrl,
    this.sendTimeout = timeoutMilliseconds,
    this.connectTimeout = timeoutMilliseconds,
    this.receiveTimeout = timeoutMilliseconds,
  });

  static const Duration timeoutMilliseconds = Duration(milliseconds: 150000);
  final String baseUrl;
  final Duration sendTimeout;
  final Duration connectTimeout;
  final Duration receiveTimeout;
}
