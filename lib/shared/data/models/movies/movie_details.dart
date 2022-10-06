import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable()
class MovieDetailsModel {
  bool? adult;
  int? budget;
  String? homepage;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;

  String? status;
  String? tagline;
  String? title;
  double? voteAverage;
  int? voteCount;

  MovieDetailsModel(
      {this.adult,
      this.budget,
      this.homepage,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.status,
      this.tagline,
      this.title,
      this.voteAverage,
      this.voteCount});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}
