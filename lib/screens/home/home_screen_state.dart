import 'package:flutter/material.dart';
import 'package:flutter_base/assets/translations/localization.dart';
import 'package:flutter_base/helpers/asset_helper.dart';
import 'package:flutter_base/repositories/authentication_reposotory/bloc/authentication_bloc.dart';
import 'package:flutter_base/repositories/authentication_reposotory/bloc/authentication_event.dart';
import 'package:flutter_base/screens/home/home_screen.dart';
import 'package:flutter_base/widgets/button/button.dart';
import 'package:flutter_base/widgets/image/image.dart';
import 'package:flutter_base/widgets/image/svg_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final username = context.select(
      (AuthenticationBloc authenticationBloc) =>
          authenticationBloc.state.userModel?.name,
    );
    username != null
        ? Fluttertoast.showToast(msg: LocalizationText.homeHelloUser(username))
        : null;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(LocalizationText.home),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageWidget(
                    imageFilePath: AssetHelper.iconUser,
                    width: 40,
                    height: 40,
                  ),
                  SvgImageWidget(
                    imageFilePath: AssetHelper.iconLogo,
                    radius: BorderRadius.all(Radius.circular(50)),
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              Center(
                child: Text(
                  username ?? "",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 32),
              Button(
                text: LocalizationText.logout,
                onPressed: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutEvent());
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
