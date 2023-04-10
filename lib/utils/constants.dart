import 'package:flutter_config/flutter_config.dart';

class Constants {
  static final apiUrl = (FlutterConfig.get('API_URL') as String?) ?? "";

  static const String prefsUserKey = "user";
}
