// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../shared/data/models/authentication/login_model.dart';
import '../../shared/data/models/authentication/req_token.dart';
import '../../shared/data/models/authentication/session_model.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationStateIdle extends AuthenticationState {}

class AuthenticationStateLoading extends AuthenticationState {}

class AuthenticationStateReqTokenSuccess extends AuthenticationState {
  final RequestTokenModel? requestTokenObj;

  AuthenticationStateReqTokenSuccess(this.requestTokenObj);
}

class AuthenticationStateSessionModelSuccess extends AuthenticationState {
  final SessionModel? sessionModel;

  AuthenticationStateSessionModelSuccess(this.sessionModel);
}

class AuthenticationStateSuccess extends AuthenticationState {
  final LoginModel? loginModelObj;

  AuthenticationStateSuccess(this.loginModelObj);
}

class AuthenticationStateFailed extends AuthenticationState {}

class AuthenticationStateChangeText extends AuthenticationState {
  final IconData iconData;
  AuthenticationStateChangeText(
    this.iconData,
  );
}

class AuthenticationStateError extends AuthenticationState {
  final NetworkExceptions networkExceptions;

  AuthenticationStateError(this.networkExceptions);
}
