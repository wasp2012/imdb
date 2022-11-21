import 'package:json_annotation/json_annotation.dart';

part 'latest.g.dart';

@JsonSerializable()
class LatestMovieModel {
  bool? adult;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? releaseDate;
  String? status;
  String? title;

  LatestMovieModel({
    this.adult,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.status,
    this.title,
  });

  factory LatestMovieModel.fromJson(Map<String, dynamic> json) =>
      _$LatestMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$LatestMovieModelToJson(this);
}
