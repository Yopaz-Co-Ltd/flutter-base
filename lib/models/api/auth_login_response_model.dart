import 'package:project_base/models/api/api_base_model.dart';

class AuthLoginResponseModel extends APIBaseModel {
  AuthLoginResponseModel(
    this.accessToken,
    String message,
    int statusCode,
  ) : super(message, statusCode);

  String accessToken;
}
