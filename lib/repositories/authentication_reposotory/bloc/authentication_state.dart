import 'package:equatable/equatable.dart';
import 'package:flutter_base/apis/models/user/user_model.dart';
import 'package:flutter_base/repositories/authentication_reposotory/authentication_repository.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus? status;
  final UserModel? userModel;

  const AuthenticationState({
    this.status,
    this.userModel,
  });

  const AuthenticationState.authenticated(
    UserModel userModel,
  ) : this(
          status: AuthenticationStatus.authenticated,
          userModel: userModel,
        );

  const AuthenticationState.unauthenticated()
      : this(
          status: AuthenticationStatus.unauthenticated,
        );

  @override
  List<Object?> get props => [status, userModel];
}
