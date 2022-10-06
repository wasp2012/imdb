// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestMovieModel _$LatestMovieModelFromJson(Map<String, dynamic> json) =>
    LatestMovieModel(
      adult: json['adult'] as bool?,
      id: json['id'] as int?,
      originalLanguage: json['originalLanguage'] as String?,
      originalTitle: json['originalTitle'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['releaseDate'] as String?,
      status: json['status'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$LatestMovieModelToJson(LatestMovieModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate,
      'status': instance.status,
      'title': instance.title,
    };
