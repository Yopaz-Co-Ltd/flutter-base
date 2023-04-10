import 'package:flutter/cupertino.dart';
import 'package:flutter_base/app/app.dart';
import 'package:flutter_base/app/view/app_view.dart';
import 'package:flutter_base/repositories/authentication_reposotory/authentication_repository.dart';
import 'package:flutter_base/repositories/authentication_reposotory/bloc/authentication_bloc.dart';
import 'package:flutter_base/repositories/authentication_reposotory/bloc/authentication_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppState extends State<App> {
  late final AuthenticationRepository _authenticationRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
        )..add(
            AuthenticationCheckEvent(),
          ),
        child: AppView(),
      ),
    );
  }
}
