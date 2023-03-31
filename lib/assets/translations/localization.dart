import 'package:easy_localization/easy_localization.dart';

class LocalizationText {
  static String login = "login".tr();
  static String home = "home".tr();
  static String favorite = "favorite".tr();
  static String next = "next".tr();

  static String favoritesCount(int count) =>
      "favorites_count".tr(args: [count.toString()]);
}
