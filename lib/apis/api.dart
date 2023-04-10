import 'package:dio/dio.dart';
import 'package:flutter_base/apis/models/api_response/api_response.dart';
import 'package:flutter_base/apis/models/user/user_model.dart';
import 'package:flutter_base/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  static final Api instance =
      Api(_createNewDioInstance(), baseUrl: Constants.apiUrl);

  factory Api(Dio dio, {String baseUrl}) = _Api;

  @POST("login")
  Future<ApiResponseModel<UserModel>> login();
}

Dio _createNewDioInstance() {
  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true, responseBody: true, responseHeader: true));
  return dio;
}
