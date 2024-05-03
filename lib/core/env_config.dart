import 'package:envied/envied.dart';

part 'env_config.g.dart';

@Envied(path: '.env', obfuscate: true)
class EnvConfig {
  EnvConfig();

  @EnviedField(varName: 'API_URL')
  static final String apiUrl = _EnvConfig.apiUrl;

  @EnviedField(varName: 'API_VERSION')
  static final String apiVersion = _EnvConfig.apiVersion;
}
