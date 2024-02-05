import 'package:flutter_config/flutter_config.dart';

class Constants {
  static final environment = FlutterConfig.get('ENVIRONMENT') ?? "";
  static final urlScheme = FlutterConfig.get("URL_SCHEME") ?? "";
  static final hostname = FlutterConfig.get("HOST_NAME") ?? "";

  static const loginPath = '/api/v1/login';

  static const prefsAccessToken = 'access_token';
  static const prefsEmail = 'email';
}
