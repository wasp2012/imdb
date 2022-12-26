import 'results.dart';
import 'package:json_annotation/json_annotation.dart';

part 'searched_movies.g.dart';


@JsonSerializable()
class SearchedMovies {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  SearchedMovies({this.page, this.results, this.totalPages, this.totalResults});

  factory SearchedMovies.fromJson(Map<String, dynamic> json) =>
      _$SearchedMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$SearchedMoviesToJson(this);
}
