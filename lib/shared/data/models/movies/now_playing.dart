import 'package:flutter/foundation.dart';
import 'package:imdb_demo/shared/data/models/movies/results.dart';
import 'package:json_annotation/json_annotation.dart';

part 'now_playing.g.dart';

@JsonSerializable()
class NowPlayingMovieModel {
  Dates? dates;
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  NowPlayingMovieModel(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  factory NowPlayingMovieModel.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingMovieModelToJson(this);
}

@JsonSerializable()
class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

  Map<String, dynamic> toJson() => _$DatesToJson(this);
}
