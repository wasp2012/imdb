import 'package:json_annotation/json_annotation.dart';

import 'results.dart';

part 'popular.g.dart';

@JsonSerializable()
class PopularMovieModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PopularMovieModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory PopularMovieModel.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMovieModelToJson(this);
}
