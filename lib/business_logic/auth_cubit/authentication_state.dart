import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../shared/data/models/authentication/login_model.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.idle() = Idle;
  const factory AuthenticationState.loading() = Loading;
  const factory AuthenticationState.obscureTextChangeState(IconData x) =
      ObscureTextChangeState;
  const factory AuthenticationState.success(data) = Success;

  const factory AuthenticationState.successLogin(LoginModel data) =
      SuccessLogin;

  const factory AuthenticationState.error(NetworkExceptions networkExceptions) =
      Error;
}
