import 'package:json_annotation/json_annotation.dart';

part 'req_token.g.dart';

@JsonSerializable()
class RequestTokenModel {
  bool? success;
  String? expiresAt;
  String? requestToken;

  RequestTokenModel({this.success, this.expiresAt, this.requestToken});

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTokenModelToJson(this);
}
