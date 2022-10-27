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

@JsonSerializable()
class AllFavoriteModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  AllFavoriteModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory AllFavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$AllFavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllFavoriteModelToJson(this);
}

@JsonSerializable()
class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
