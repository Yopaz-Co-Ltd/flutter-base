import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;

  const Button({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text ?? "",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
