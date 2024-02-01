import 'package:flutter/material.dart';
import 'package:project_base/api/api_status.dart';
import 'package:project_base/models/state/app_state.dart';
import 'package:project_base/models/state/login_state.dart';
import 'package:project_base/screen/login/widget/login_form_widget.dart';
import 'package:project_base/utils/toast_utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        BuildContext context,
        LoginStateModel loginStateModel,
        Widget? child,
      ) {
        if (loginStateModel.apiStatus == ApiStatus.apiSuccess) {
          Future.microtask(
            () => {
              context.read<AppStateModel>().setIsLoggedIn(true),
              loginStateModel.resetApiStatus(),
            },
          );
        }

        if (loginStateModel.apiStatus == ApiStatus.apiError) {
          ToastUtils.showToast('Something went wrong');
        }

        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                centerTitle: true,
                title: const Text('Login'),
              ),
              body: const Column(
                children: [
                  SizedBox(
                    height: 48,
                  ),
                  LoginFormWidget(),
                ],
              ),
            ),
            (loginStateModel.apiStatus == ApiStatus.apiCalling)
                ? Container(
                    color: Colors.transparent,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
