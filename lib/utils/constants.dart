import 'package:flutter_config/flutter_config.dart';

class Constants {
  static final apiUrl = FlutterConfig.get('API_URL') ?? "";
  static final environment = FlutterConfig.get('ENVIRONMENT') ?? "";
}
