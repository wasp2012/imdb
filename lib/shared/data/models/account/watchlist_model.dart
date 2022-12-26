import 'package:json_annotation/json_annotation.dart';


part 'watchlist_model.g.dart';


@JsonSerializable()
class WatchListModel {
  int? statusCode;
  String? statusMessage;
  bool? success;

  WatchListModel({this.statusCode, this.statusMessage, this.success});

  factory WatchListModel.fromJson(Map<String, dynamic> json) =>
      _$WatchListModelFromJson(json);

  Map<String, dynamic> toJson() => _$WatchListModelToJson(this);
}

@JsonSerializable()
class WatchListBody {
  String? mediaType;
  int? mediaId;
  bool? watchList;

  WatchListBody({this.mediaType, this.mediaId, this.watchList});

  factory WatchListBody.fromJson(Map<String, dynamic> json) =>
      _$WatchListBodyFromJson(json);

  Map<String, dynamic> toJson() => _$WatchListBodyToJson(this);
}
