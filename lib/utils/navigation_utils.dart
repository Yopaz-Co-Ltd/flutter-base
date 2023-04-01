import 'package:flutter/material.dart';
import 'package:flutter_base/screens/screen_names.dart';

class NavigationUtils {
  static void navigate(
    BuildContext context,
    ScreenName screenName, {
    Object? arguments,
  }) {
    Navigator.of(context).pushNamed(screenName.name, arguments: arguments);
  }

  static T? getArguments<T>(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    return arguments is T ? arguments : null;
  }

  static void navigateWithAnimation(BuildContext context, ScreenName screenName,
      {Widget Function(
              BuildContext, Animation<double>, Animation<double>, Widget)?
          animation,
      int? duration}) {
    final screenRoute = screenRoutes[screenName.name];
    if (screenRoute == null) return;
    final screen = screenRoute(context);

    Navigator.of(context).push(NavigationUtils.buildPageRoute(
        screenName, screen,
        transitionsBuilder: animation, duration: duration));
  }

  static Route buildPageRoute(ScreenName screenName, Widget screen,
      {Widget Function(
              BuildContext, Animation<double>, Animation<double>, Widget)?
          transitionsBuilder,
      int? duration}) {
    const int defaultDuration = 300;
    Widget defaultTransitionsBuilder(
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return child;
    }

    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionDuration: Duration(milliseconds: duration ?? defaultDuration),
        reverseTransitionDuration:
            Duration(milliseconds: duration ?? defaultDuration),
        transitionsBuilder: transitionsBuilder ?? defaultTransitionsBuilder,
        settings: RouteSettings(name: screenName.name));
  }
}
