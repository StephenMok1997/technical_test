class DioConfig {
  static const Duration timeoutMilliseconds = Duration(milliseconds: 150000);
  final String apiUrl;
  final Duration sendTimeout;
  final Duration connectTimeout;
  final Duration receiveTimeout;

  DioConfig({
    required this.apiUrl,
    this.sendTimeout = timeoutMilliseconds,
    this.connectTimeout = timeoutMilliseconds,
    this.receiveTimeout = timeoutMilliseconds,
  });
}
