import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/view/app_view.dart';
import 'package:flutter_base/repositories/authentication_reposotory/authentication_repository.dart';
import 'package:flutter_base/repositories/authentication_reposotory/bloc/authentication_bloc.dart';
import 'package:flutter_base/repositories/authentication_reposotory/bloc/authentication_state.dart';
import 'package:flutter_base/screens/home/home_screen.dart';
import 'package:flutter_base/screens/login/login_screen.dart';
import 'package:flutter_base/screens/screen_names.dart';
import 'package:flutter_base/screens/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppViewState extends State<AppView> {
  final _navigationKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigatorState => _navigationKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigationKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigatorState?.pushAndRemoveUntil(
                  HomeScreen.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigatorState?.pushAndRemoveUntil(
                  LoginScreen.route(),
                  (route) => false,
                );
                break;
              case null:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (context) => SplashScreen.route(),
      routes: screenRoutes,
    );
  }
}
