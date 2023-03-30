import 'package:flutter/material.dart';
import 'package:flutter_base/app_state.dart';
import 'package:flutter_base/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Flutter Base',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
