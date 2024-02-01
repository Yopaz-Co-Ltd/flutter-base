import 'package:flutter/material.dart';
import 'package:project_base/models/state/app_state.dart';
import 'package:project_base/screen/home/home_screen.dart';
import 'package:project_base/screen/login/login_screen.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final isLogin = true;

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AppStateModel>().isLoggedIn;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
    );
  }
}
