// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestMovieModel _$LatestMovieModelFromJson(Map<String, dynamic> json) =>
    LatestMovieModel(
      adult: json['adult'] as bool?,
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      status: json['status'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$LatestMovieModelToJson(LatestMovieModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'status': instance.status,
      'title': instance.title,
    };
