import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static SharedPreferences? _prefsInstance;

  static Future<void> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
  }

  static String getString(String key) {
    return _prefsInstance?.getString(key) ?? "";
  }

  static Future<void> setString(String key, String value) async {
    await _prefsInstance?.setString(key, value);
  }

  static int? getInt(String key) {
    return _prefsInstance?.getInt(key);
  }

  static Future<void> setInt(String key, int value) async {
    await _prefsInstance?.setInt(key, value);
  }

  static Future<void> remove(String key) async {
    await _prefsInstance?.remove(key);
  }
}
