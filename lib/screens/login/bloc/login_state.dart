import 'package:equatable/equatable.dart';

enum LoginStatus { inProgress, failure }

class LoginState extends Equatable {
  final LoginStatus? loginStatus;
  final String? username;
  final String? password;

  const LoginState({
    this.username,
    this.loginStatus,
    this.password,
  });

  LoginState copyWith(
      {LoginStatus? loginStatus, String? username, String? password}) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [loginStatus, username, password];
}
