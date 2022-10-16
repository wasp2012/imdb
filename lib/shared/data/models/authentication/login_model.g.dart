// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      success: json['success'] as bool?,
      expiresAt: json['expires_at'] as String?,
      requestToken: json['request_token'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'expires_at': instance.expiresAt,
      'request_token': instance.requestToken,
    };

LogInBodyModel _$LogInBodyModelFromJson(Map<String, dynamic> json) =>
    LogInBodyModel(
      username: json['username'] as String?,
      password: json['password'] as String?,
      requestToken: json['request_token'] as String?,
    );

Map<String, dynamic> _$LogInBodyModelToJson(LogInBodyModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'request_token': instance.requestToken,
    };
