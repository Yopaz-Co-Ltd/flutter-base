import 'package:flutter_base/screens/home/home_screen.dart';
import 'package:flutter_base/screens/login/login_screen.dart';

enum ScreenName { login, home }

final screenRoutes = {
  ScreenName.login.name: (context) => LoginScreen(),
  ScreenName.home.name: (context) => HomeScreen()
};
