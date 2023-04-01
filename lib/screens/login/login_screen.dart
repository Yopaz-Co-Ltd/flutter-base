import 'package:flutter/material.dart';
import 'package:flutter_base/assets/translations/localization.dart';
import 'package:flutter_base/screens/home/home_screen.dart';
import 'package:flutter_base/screens/login/views/login_button.dart';
import 'package:flutter_base/utils/navigation_utils.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationText.login),
      ),
      body: SafeArea(
          child: Column(
        children: [
          LoginButton(
            onPressed: () {
              NavigationUtils.navigate(context, HomeScreen());
            },
          )
        ],
      )),
    );
  }
}
