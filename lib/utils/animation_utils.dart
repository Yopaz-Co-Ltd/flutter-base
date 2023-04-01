import 'package:flutter/material.dart';

class AnimationUtils {
  static Widget Function(
          BuildContext, Animation<double>, Animation<double>, Widget)
      slideRightToLeft = (context, animation, secondaryAnimation, child) {
    return SlideTransition(
      position: animation.drive(Tween(begin: Offset(1, 0), end: Offset.zero)),
      child: child,
    );
  };

  static Widget Function(
          BuildContext, Animation<double>, Animation<double>, Widget)
      slideLeftToRight = (context, animation, secondaryAnimation, child) {
    return SlideTransition(
      position: animation.drive(Tween(begin: Offset(-1, 0), end: Offset.zero)),
      child: child,
    );
  };

  static Widget Function(
          BuildContext, Animation<double>, Animation<double>, Widget)
      slideTopToBottom = (context, animation, secondaryAnimation, child) {
    return SlideTransition(
      position: animation.drive(Tween(begin: Offset(0, -1), end: Offset.zero)),
      child: child,
    );
  };

  static Widget Function(
          BuildContext, Animation<double>, Animation<double>, Widget)
      slideBottomToTop = (context, animation, secondaryAnimation, child) {
    return SlideTransition(
      position: animation.drive(Tween(begin: Offset(0, 1), end: Offset.zero)),
      child: child,
    );
  };

  static Widget Function(
          BuildContext, Animation<double>, Animation<double>, Widget)
      fadeThrough = (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  };
}
