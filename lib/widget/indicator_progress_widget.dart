import 'package:flutter/material.dart';

class IndicatorProgressWidget extends StatelessWidget {
  const IndicatorProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }
}
