// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingMovieModel _$TrendingMovieModelFromJson(Map<String, dynamic> json) =>
    TrendingMovieModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$TrendingMovieModelToJson(TrendingMovieModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      adult: json['adult'] as bool?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      originalName: json['originalName'] as String?,
      mediaType: json['mediaType'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      knownFor: (json['knownFor'] as List<dynamic>?)
          ?.map((e) => KnownFor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'name': instance.name,
      'originalName': instance.originalName,
      'mediaType': instance.mediaType,
      'popularity': instance.popularity,
      'knownFor': instance.knownFor,
    };

KnownFor _$KnownForFromJson(Map<String, dynamic> json) => KnownFor(
      adult: json['adult'] as bool?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      originalLanguage: json['originalLanguage'] as String?,
      originalTitle: json['originalTitle'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      mediaType: json['mediaType'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      releaseDate: json['releaseDate'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      voteCount: json['voteCount'] as int?,
    );

Map<String, dynamic> _$KnownForToJson(KnownFor instance) => <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'title': instance.title,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'mediaType': instance.mediaType,
      'popularity': instance.popularity,
      'releaseDate': instance.releaseDate,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
