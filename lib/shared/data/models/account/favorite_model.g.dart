// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) =>
    FavoriteModel(
      statusCode: json['status_code'] as int?,
      statusMessage: json['status_message'] as String?,
    );

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };

FavoriteBody _$FavoriteBodyFromJson(Map<String, dynamic> json) => FavoriteBody(
      mediaType: json['media_type'] as String?,
      mediaId: json['media_id'] as int?,
      favorite: json['favorite'] as bool?,
    );

Map<String, dynamic> _$FavoriteBodyToJson(FavoriteBody instance) =>
    <String, dynamic>{
      'media_type': instance.mediaType,
      'media_id': instance.mediaId,
      'favorite': instance.favorite,
    };
