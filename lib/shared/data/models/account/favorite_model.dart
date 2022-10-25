import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  int? statusCode;
  String? statusMessage;

  FavoriteModel({this.statusCode, this.statusMessage});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}

@JsonSerializable()
class FavoriteBody {
  String? mediaType;
  int? mediaId;
  bool? favorite;

  FavoriteBody({this.mediaType, this.mediaId, this.favorite});

  factory FavoriteBody.fromJson(Map<String, dynamic> json) =>
      _$FavoriteBodyFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteBodyToJson(this);
}
