import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_base/api/api_status.dart';
import 'package:project_base/api/auth/login.dart';
import 'package:project_base/models/api/auth_login_response_model.dart';
import 'package:project_base/utils/constants.dart';
import 'package:project_base/utils/local_storage_helper.dart';

class LoginStateModel extends ChangeNotifier {
  ApiStatus _apiStatus = ApiStatus.initial;
  String _email = '';
  String _password = '';

  ApiStatus get apiStatus => _apiStatus;
  String get email => _email;
  String get password => _password;

  void setEmailAndPassword(
    String email,
    String password,
  ) {
    _email = email;
    _password = password;
    notifyListeners();
  }

  void resetApiStatus() {
    _apiStatus = ApiStatus.initial;
  }

  Future<void> saveAccessToken(
    AuthLoginResponseModel response,
    String email,
  ) async {
    LocalStorageHelper.setString(
      Constants.prefsAccessToken,
      response.accessToken,
    );
    LocalStorageHelper.setString(
      Constants.prefsEmail,
      email,
    );
  }

  Future<void> login(email, password) async {
    _apiStatus = ApiStatus.apiCalling;
    notifyListeners();

    final body = {
      'email': email,
      'password': password,
    };
    final response = await AuthLoginApi({}).login(jsonEncode(body));

    switch (response.statusCode) {
      case HttpStatus.ok:
        _apiStatus = ApiStatus.apiSuccess;
        setEmailAndPassword(email, password);
        notifyListeners();
        break;

      // TODO: Remove fake res.statusCode == HttpStatus.created
      case HttpStatus.created:
        _apiStatus = ApiStatus.apiSuccess;
        setEmailAndPassword(email, password);
        saveAccessToken(response, email);
        notifyListeners();
        break;
      default:
        _apiStatus = ApiStatus.apiError;
        notifyListeners();
        break;
    }
  }
}
