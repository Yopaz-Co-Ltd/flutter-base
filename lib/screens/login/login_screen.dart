import 'package:flutter/material.dart';
import 'package:flutter_base/apis/api.dart';
import 'package:flutter_base/assets/translations/localization.dart';
import 'package:flutter_base/screens/login/views/login_button.dart';

import '../../utils/navigation_utils.dart';
import '../home/home_screen.dart';

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
              Api.instance.login().then((result) {
                print(result.data?.name);
                NavigationUtils.navigate(context, HomeScreen());
              });
            },
          )
        ],
      )),
    );
  }
}
