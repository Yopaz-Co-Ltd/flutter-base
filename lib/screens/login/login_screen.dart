import 'package:flutter/material.dart';
import 'package:flutter_base/apis/api.dart';
import 'package:flutter_base/assets/translations/localization.dart';
import 'package:flutter_base/screens/home/home_screen_arguments.dart';
import 'package:flutter_base/screens/login/views/login_button.dart';
import 'package:flutter_base/screens/screen_names.dart';
import 'package:flutter_base/widgets/loading/loading.dart';

import '../../utils/navigation_utils.dart';

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
              Loading.show(context);
              Api.instance.login().then((result) {
                Loading.dismiss(context);
                NavigationUtils.navigate(context, ScreenName.home,
                    arguments:
                        HomeScreenArguments(userName: result.data?.name));
              });
            },
          )
        ],
      )),
    );
  }
}
