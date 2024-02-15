import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_base/models/api/api_response_model.dart';
import 'package:project_base/utils/constants.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class NetworkHelper {
  NetworkHelper({
    required this.endPoint,
    this.queryParameters,
    required this.accessToken,
  }) {
    _createHeaders(accessToken);
  }

  final String endPoint;
  final Map<String, dynamic>? queryParameters;
  final String accessToken;
  final Map<String, String> headers = {};

  Uri _getUri() {
    Uri uri;
    if (Constants.urlScheme == 'http') {
      uri = Uri.http(
        Constants.hostname,
        endPoint,
        queryParameters,
      );
    } else {
      uri = Uri.https(
        Constants.hostname,
        endPoint,
        queryParameters,
      );
    }
    logger.i(uri);

    return uri;
  }

  void _createHeaders(String accessToken) {
    headers['Content-Type'] = 'application/json; charset=UTF-8';
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
  }

  Future<APIResponseModel> callGet() async {
    try {
      http.Response response;
      Uri uri = _getUri();

      response = await http.get(
        uri,
        headers: headers,
      );

      logger.d('statusCode: ${response.statusCode}');
      logger.d('Body: ${utf8.decode(response.bodyBytes)}');

      String data = response.body;
      dynamic jsonObjects = jsonDecode(data);

      return APIResponseModel(
        jsonObjects['data'],
        response.statusCode,
        jsonObjects['message'] ?? '',
      );
    } catch (exception) {
      logger.e(exception);
      return APIResponseModel(
        {"error": exception},
        404,
        '',
      );
    }
  }

  Future<APIResponseModel> callPost(String body) async {
    try {
      http.Response response;
      Uri uri = _getUri();

      response = await http.post(
        uri,
        headers: headers,
        body: body,
      );

      String data = response.body;
      dynamic jsonObjects = jsonDecode(data);

      return APIResponseModel(
        jsonObjects,
        response.statusCode,
        jsonObjects['message'] ?? '',
      );
    } catch (exception) {
      logger.e(exception);
      return APIResponseModel(
        {"error": exception},
        404,
        '',
      );
    }
  }
}
