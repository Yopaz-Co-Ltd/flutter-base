import 'package:flutter/material.dart';
import 'package:flutter_base/utils/animation_utils.dart';

class NavigationUtils {
  static void navigate(BuildContext context, Widget screen,
      {Widget Function(
              BuildContext, Animation<double>, Animation<double>, Widget)?
          animation,
      int duration = 200}) {
    Navigator.of(context).push(NavigationUtils.buildPageRoute(
        screen, animation ?? AnimationUtils.slideRightToLeft, duration));
  }

  static Route buildPageRoute(
      Widget screen,
      Widget Function(
              BuildContext, Animation<double>, Animation<double>, Widget)
          transitionsBuilder,
      int duration) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionDuration: Duration(milliseconds: duration),
        reverseTransitionDuration: Duration(milliseconds: duration),
        transitionsBuilder: transitionsBuilder);
  }
}
