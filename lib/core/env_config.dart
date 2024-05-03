import 'package:envied/envied.dart';

part 'env_config.g.dart';

@Envied(path: '.env', obfuscate: true)
class EnvConfig implements BaseConfig {
  EnvConfig();

  @override
  @EnviedField(varName: 'API_URL')
  final String apiUrl = _EnvConfig.apiUrl;
  @override
  @EnviedField(varName: 'API_VERSION')
  final String apiVersion = _EnvConfig.apiVersion;
}

abstract class BaseConfig {
  String get apiUrl;
  String get apiVersion;
}
