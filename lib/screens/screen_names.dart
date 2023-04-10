import 'package:flutter_base/screens/home/home_screen.dart';

enum ScreenName { home }

final screenRoutes = {
  ScreenName.home.name: (context) => HomeScreen(),
};
