import 'package:flutter/material.dart';
import 'package:flutter_base/assets/translations/localization.dart';
import 'package:flutter_base/repositories/authentication_reposotory/authentication_repository.dart';
import 'package:flutter_base/screens/login/bloc/login_bloc.dart';
import 'package:flutter_base/screens/login/bloc/login_event.dart';
import 'package:flutter_base/screens/login/bloc/login_state.dart';
import 'package:flutter_base/screens/screen_names.dart';
import 'package:flutter_base/utils/animation_utils.dart';
import 'package:flutter_base/widgets/button/button.dart';
import 'package:flutter_base/widgets/loading/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Route route() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
        transitionsBuilder: AnimationUtils.fadeThrough,
        settings: RouteSettings(name: ScreenName.home.name),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationText.login),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginBloc(
            authenticationRepository: context.read<AuthenticationRepository>(),
          ),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              switch (state.loginStatus) {
                case LoginStatus.inProgress:
                  Loading.show(context);
                  break;
                case LoginStatus.failure:
                  Fluttertoast.showToast(msg: LocalizationText.loginFailed);
                  break;
                case null:
                  break;
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Button(
                  text: LocalizationText.login,
                  onPressed: () {
                    context.read<LoginBloc>().add(LoginSubmitEvent());
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
