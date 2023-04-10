import 'dart:async';

import 'package:flutter_base/repositories/authentication_reposotory/authentication_repository.dart';
import 'package:flutter_base/screens/login/bloc/login_event.dart';
import 'package:flutter_base/screens/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginSubmitEvent>(_login);
  }

  Future<void> _login(
    LoginSubmitEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(loginStatus: LoginStatus.inProgress));
    try {
      await _authenticationRepository.logIn(
        username: state.username,
        password: state.password,
      );
    } catch (_) {
      emit(state.copyWith(loginStatus: LoginStatus.failure));
    }
  }
}
