import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale("en"), Locale("vi"), Locale("ja")],
        path: 'lib/assets/translations',
        fallbackLocale: Locale("en"),
        startLocale: Locale("vi"),
        useFallbackTranslations: true,
        child: App()),
  );
}