// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedMovieModel _$TopRatedMovieModelFromJson(Map<String, dynamic> json) =>
    TopRatedMovieModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$TopRatedMovieModelToJson(TopRatedMovieModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
