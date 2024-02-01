import 'package:flutter/material.dart';
import 'package:project_base/models/state/login_state.dart';
import 'package:provider/provider.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              onChanged: (value) {
                _email = value;
              },
            ),
            const SizedBox(
              height: 48,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(
              height: 48,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                context.read<LoginStateModel>().login(_email, _password);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
