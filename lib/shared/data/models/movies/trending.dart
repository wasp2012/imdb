import 'package:json_annotation/json_annotation.dart';

part 'trending.g.dart';

@JsonSerializable()
class TrendingMovieModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  TrendingMovieModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory TrendingMovieModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingMovieModelToJson(this);
}

@JsonSerializable()
class Results {
  bool? adult;
  int? id;
  String? name;
  String? originalName;
  String? mediaType;
  double? popularity;
  List<KnownFor>? knownFor;

  Results(
      {this.adult,
      this.id,
      this.name,
      this.originalName,
      this.mediaType,
      this.popularity,
      this.knownFor});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class KnownFor {
  bool? adult;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  double? popularity;
  String? releaseDate;
  double? voteAverage;
  int? voteCount;

  KnownFor(
      {this.adult,
      this.id,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.popularity,
      this.releaseDate,
      this.voteAverage,
      this.voteCount});

  factory KnownFor.fromJson(Map<String, dynamic> json) =>
      _$KnownForFromJson(json);

  Map<String, dynamic> toJson() => _$KnownForToJson(this);
}
