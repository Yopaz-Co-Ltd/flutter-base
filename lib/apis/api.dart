import 'package:dio/dio.dart';
import 'package:flutter_base/apis/models/api_response/api_response.dart';
import 'package:flutter_base/apis/models/user/user.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://demo6587384.mockable.io/")
abstract class Api {
  static Api instance = Api(Dio());

  factory Api(Dio dio, {String baseUrl}) = _Api;

  @POST("login")
  Future<ApiResponseModel<UserModel>> login();
}
