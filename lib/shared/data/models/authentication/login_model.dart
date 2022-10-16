// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  bool? success;
  String? expiresAt;
  String? requestToken;

  LoginModel({this.success, this.expiresAt, this.requestToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class LogInBodyModel {
  String? username;
  String? password;
  String? requestToken;
  LogInBodyModel({
    this.username,
    this.password,
    this.requestToken,
  });
  factory LogInBodyModel.fromJson(Map<String, dynamic> json) =>
      _$LogInBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogInBodyModelToJson(this);
}
