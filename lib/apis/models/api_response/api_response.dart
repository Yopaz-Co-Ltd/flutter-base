import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponseModel<T> {
  T? data;

  ApiResponseModel({this.data});

  factory ApiResponseModel.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) jsonToT) =>
      _$ApiResponseModelFromJson(json, jsonToT);
}
