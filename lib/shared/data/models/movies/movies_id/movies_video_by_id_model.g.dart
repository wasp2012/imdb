// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_video_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideoById _$MovieVideoByIdFromJson(Map<String, dynamic> json) =>
    MovieVideoById(
      id: json['id'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => VideoForMovieResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieVideoByIdToJson(MovieVideoById instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };

VideoForMovieResult _$VideoForMovieResultFromJson(Map<String, dynamic> json) =>
    VideoForMovieResult(
      name: json['name'] as String?,
      key: json['key'] as String?,
      site: json['site'] as String?,
      type: json['type'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$VideoForMovieResultToJson(
        VideoForMovieResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'type': instance.type,
      'id': instance.id,
    };
