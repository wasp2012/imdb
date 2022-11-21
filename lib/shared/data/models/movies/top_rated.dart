import 'results.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'top_rated.g.dart';

@JsonSerializable()
class TopRatedMovieModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  TopRatedMovieModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory TopRatedMovieModel.fromJson(Map<String, dynamic> json) =>
      _$TopRatedMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedMovieModelToJson(this);
}
