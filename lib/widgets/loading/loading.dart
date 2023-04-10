import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  static var isLoadingShown = false;

  static final Widget centerLoadingWidget = Center(
    child: Loading(),
  );

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (context) => centerLoadingWidget,
    );
    isLoadingShown = true;
  }

  static void dismiss(BuildContext context) {
    if (!isLoadingShown) return;
    Navigator.of(context).pop();
    isLoadingShown = false;
  }

  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: Colors.black,
      size: 64.0,
    );
  }
}
