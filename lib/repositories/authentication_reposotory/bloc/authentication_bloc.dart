import 'dart:async';

import 'package:flutter_base/apis/models/user/user_model.dart';
import 'package:flutter_base/repositories/authentication_reposotory/authentication_repository.dart';
import 'package:flutter_base/repositories/authentication_reposotory/bloc/authentication_event.dart';
import 'package:flutter_base/repositories/authentication_reposotory/bloc/authentication_state.dart';
import 'package:flutter_base/repositories/user_repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    UserRepository userRepository = const UserRepository(),
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState()) {
    on<AuthenticationCheckEvent>(_checkAuthentication);
    on<AuthenticationStatusChangeEvent>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutEvent>(_logOut);
    _authenticationStatusSubscription =
        _authenticationRepository.authenticationStatusStream.listen(
      (status) => add(AuthenticationStatusChangeEvent(status)),
    );
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _checkAuthentication(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    if (event is AuthenticationCheckEvent) {
      await Future.delayed(Duration(milliseconds: 1500));
    }
    final userModel = await _getLocalUserModel();
    emit(
      userModel != null
          ? AuthenticationState.authenticated(userModel)
          : const AuthenticationState.unauthenticated(),
    );
  }

  Future<void> _onAuthenticationStatusChanged(
    AuthenticationStatusChangeEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        _checkAuthentication(event, emit);
    }
  }

  void _logOut(
    AuthenticationLogoutEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
    _userRepository.deleteLocalUserModel();
  }

  Future<UserModel?> _getLocalUserModel() async {
    try {
      return await _userRepository.getLocalUserModel();
    } catch (_) {
      return null;
    }
  }
}
