import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/loading/loading.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Loading(),
      ),
    );
  }
}
