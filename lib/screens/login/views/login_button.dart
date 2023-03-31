import 'package:flutter/material.dart';
import 'package:flutter_base/assets/translations/localization.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            LocalizationText.login,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
