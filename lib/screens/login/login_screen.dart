import 'package:flutter/material.dart';
import 'package:flutter_base/screens/home/home_screen.dart';
import 'package:flutter_base/screens/login/views/login_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          LoginButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          )
        ],
      )),
    );
  }
}
