import 'package:flutter/material.dart';
import 'package:flutter_base/screens/home/home_screen_state.dart';
import 'package:flutter_base/screens/screen_names.dart';
import 'package:flutter_base/utils/animation_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route route() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        transitionsBuilder: AnimationUtils.fadeThrough,
        settings: RouteSettings(name: ScreenName.home.name),
      );

  @override
  State<HomeScreen> createState() => HomeScreenState();
}
