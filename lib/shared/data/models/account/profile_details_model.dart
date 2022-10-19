import 'package:json_annotation/json_annotation.dart';

part 'profile_details_model.g.dart';

@JsonSerializable()
class UserDetailsModel {
  Avatar? avatar;
  int? id;
  String? iso6391;
  String? iso31661;
  String? name;
  bool? includeAdult;
  String? username;

  UserDetailsModel(
      {this.avatar,
      this.id,
      this.iso6391,
      this.iso31661,
      this.name,
      this.includeAdult,
      this.username});

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsModelToJson(this);
}

@JsonSerializable()
class Avatar {
  Gravatar? gravatar;
  Tmdb? tmdb;

  Avatar({this.gravatar, this.tmdb});
  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}

@JsonSerializable()
class Gravatar {
  String? hash;

  Gravatar({this.hash});
  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);

  Map<String, dynamic> toJson() => _$GravatarToJson(this);
}

@JsonSerializable()
class Tmdb {
  String? avatarPath;

  Tmdb({this.avatarPath});
  factory Tmdb.fromJson(Map<String, dynamic> json) => _$TmdbFromJson(json);

  Map<String, dynamic> toJson() => _$TmdbToJson(this);
}
