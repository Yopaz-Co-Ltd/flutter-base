class APIResponseModel {
  APIResponseModel(
    this.data,
    this.statusCode,
    this.message,
  );

  dynamic data;
  int statusCode;
  String message;
}
