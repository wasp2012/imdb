// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) =>
    FavoriteModel(
      statusCode: json['statusCode'] as int?,
      statusMessage: json['statusMessage'] as String?,
    );

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
    };

FavoriteBody _$FavoriteBodyFromJson(Map<String, dynamic> json) => FavoriteBody(
      mediaType: json['mediaType'] as String?,
      mediaId: json['mediaId'] as int?,
      favorite: json['favorite'] as bool?,
    );

Map<String, dynamic> _$FavoriteBodyToJson(FavoriteBody instance) =>
    <String, dynamic>{
      'mediaType': instance.mediaType,
      'mediaId': instance.mediaId,
      'favorite': instance.favorite,
    };

AllFavoriteModel _$AllFavoriteModelFromJson(Map<String, dynamic> json) =>
    AllFavoriteModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$AllFavoriteModelToJson(AllFavoriteModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
