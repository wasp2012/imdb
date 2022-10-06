import 'package:json_annotation/json_annotation.dart';

part 'movies_video_by_id_model.g.dart';

@JsonSerializable()
class MovieVideoById {
  int? id;
  List<VideoForMovieResult>? results;

  MovieVideoById({this.id, this.results});

  factory MovieVideoById.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoByIdFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoByIdToJson(this);
}

@JsonSerializable()
class VideoForMovieResult {
  String? name;
  String? key;
  String? site;
  String? type;
  String? id;

  VideoForMovieResult({this.name, this.key, this.site, this.type, this.id});

  factory VideoForMovieResult.fromJson(Map<String, dynamic> json) =>
      _$VideoForMovieResultFromJson(json);

  Map<String, dynamic> toJson() => _$VideoForMovieResultToJson(this);
}
