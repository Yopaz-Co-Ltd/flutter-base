import 'dart:io';

import 'package:project_base/models/api/api_response_model.dart';
import 'package:project_base/models/api/auth_login_response_model.dart';
import 'package:project_base/utils/constants.dart';
import 'package:project_base/utils/network_helper.dart';

class AuthLoginApi {
  late NetworkHelper helper;
  Map<String, String>? queryParameters = {};

  AuthLoginApi(
    this.queryParameters,
  ) {
    helper = NetworkHelper(
      endPoint: Constants.loginPath,
      queryParameters: queryParameters,
      accessToken: '',
    );
  }

  Future<AuthLoginResponseModel> login(String body) async {
    var res = await helper.callPost(body);
    return generateAuthLogin(res);
  }
}

AuthLoginResponseModel generateAuthLogin(APIResponseModel res) {
  // TODO: Remove fake res.statusCode == HttpStatus.created
  if (res.statusCode == HttpStatus.ok || res.statusCode == HttpStatus.created) {
    return AuthLoginResponseModel(
      res.data['access_token'].toString(),
      res.message,
      res.statusCode,
    );
  } else {
    return AuthLoginResponseModel(
      "",
      res.message,
      res.statusCode,
    );
  }
}
