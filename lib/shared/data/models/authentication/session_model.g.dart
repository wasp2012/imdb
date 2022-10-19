// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      success: json['success'] as bool?,
      sessionId: json['session_id'] as String?,
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'session_id': instance.sessionId,
    };

SessionBody _$SessionBodyFromJson(Map<String, dynamic> json) => SessionBody(
      requestToken: json['request_token'] as String?,
    );

Map<String, dynamic> _$SessionBodyToJson(SessionBody instance) =>
    <String, dynamic>{
      'request_token': instance.requestToken,
    };
