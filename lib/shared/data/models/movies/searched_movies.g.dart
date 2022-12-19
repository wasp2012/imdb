// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedMovies _$SearchedMoviesFromJson(Map<String, dynamic> json) =>
    SearchedMovies(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$SearchedMoviesToJson(SearchedMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
