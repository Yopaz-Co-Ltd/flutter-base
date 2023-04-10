import 'dart:async';
import 'dart:convert';

import 'package:flutter_base/apis/api.dart';
import 'package:flutter_base/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get authenticationStatusStream async* {
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String? username,
    required String? password,
  }) async {
    try {
      final loginResponse = await Api.instance.login();

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final isUserSaved = await prefs.setString(
        Constants.prefsUserKey,
        jsonEncode(loginResponse.data?.toJson()),
      );
      _controller.add(
        isUserSaved
            ? AuthenticationStatus.authenticated
            : AuthenticationStatus.unauthenticated,
      );
    } catch (exception) {
      _controller.add(AuthenticationStatus.unauthenticated);
      rethrow;
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
