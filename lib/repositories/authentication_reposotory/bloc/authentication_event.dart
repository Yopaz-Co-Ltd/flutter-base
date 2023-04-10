import 'package:flutter_base/repositories/authentication_reposotory/authentication_repository.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationCheckEvent extends AuthenticationEvent {}

class AuthenticationStatusChangeEvent extends AuthenticationEvent {
  const AuthenticationStatusChangeEvent(this.status);

  final AuthenticationStatus status;
}

class AuthenticationLogoutEvent extends AuthenticationEvent {}
