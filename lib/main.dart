import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:project_base/app/app.dart';
import 'package:project_base/models/state/app_state.dart';
import 'package:project_base/models/state/login_state.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppStateModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginStateModel(),
        ),
      ],
      child: const App(),
    ),
  );
}
