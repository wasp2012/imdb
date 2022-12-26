// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchListModel _$WatchListModelFromJson(Map<String, dynamic> json) =>
    WatchListModel(
      statusCode: json['status_code'] as int?,
      statusMessage: json['status_message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$WatchListModelToJson(WatchListModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'success': instance.success,
    };

WatchListBody _$WatchListBodyFromJson(Map<String, dynamic> json) =>
    WatchListBody(
      mediaType: json['media_type'] as String?,
      mediaId: json['media_id'] as int?,
      watchList: json['watchlist'] as bool?,
    );

Map<String, dynamic> _$WatchListBodyToJson(WatchListBody instance) =>
    <String, dynamic>{
      'media_type': instance.mediaType,
      'media_id': instance.mediaId,
      'watchlist': instance.watchList,
    };
