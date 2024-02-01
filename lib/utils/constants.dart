import 'package:flutter_config/flutter_config.dart';

class Constants {
  static final environment = FlutterConfig.get('ENVIRONMENT') ?? "";
  static var urlScheme = FlutterConfig.get("URL_SCHEME");
  static var hostname = FlutterConfig.get("HOST_NAME");

  static const loginPath = '/api/v1/login';
}
