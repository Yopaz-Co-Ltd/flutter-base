import 'package:easy_localization/easy_localization.dart';

class LocalizationText {
  static String login = "login".tr();
  static String home = "home".tr();
  static String logout = "logout".tr();
  static String loginFailed = "login_failed".tr();

  static String homeHelloUser(String userName) =>
      "home_hello_user".tr(args: [userName]);
}
