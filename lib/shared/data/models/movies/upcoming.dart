import 'results.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'upcoming.g.dart';

@JsonSerializable()
class UpcomingMovieModel {
  Dates? dates;
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  UpcomingMovieModel(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  factory UpcomingMovieModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingMovieModelToJson(this);
}

@JsonSerializable()
class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

  Map<String, dynamic> toJson() => _$DatesToJson(this);
}
