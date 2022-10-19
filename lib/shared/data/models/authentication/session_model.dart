import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable()
class SessionModel {
  bool? success;
  String? sessionId;

  SessionModel({this.success, this.sessionId});
  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}

@JsonSerializable()
class SessionBody {
  String? requestToken;

  SessionBody({this.requestToken});
  factory SessionBody.fromJson(Map<String, dynamic> json) =>
      _$SessionBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SessionBodyToJson(this);
}
