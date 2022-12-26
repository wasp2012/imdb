import '../movies/results.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_watchlist_model.g.dart';

@JsonSerializable()
class WatchListResultModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  WatchListResultModel(
      {this.page, this.results, this.totalPages, this.totalResults});
  factory WatchListResultModel.fromJson(Map<String, dynamic> json) =>
      _$WatchListResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$WatchListResultModelToJson(this);
}
