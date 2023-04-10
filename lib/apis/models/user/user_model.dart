import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  int? id;
  String? name;
  int? age;

  UserModel({this.id, this.name, this.age});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
