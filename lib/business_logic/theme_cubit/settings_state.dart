// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/data/models/account/profile_details_model.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

@immutable
abstract class SettingState {}

class SettingStateIdle extends SettingState {}

class SettingStateLoading extends SettingState {}

class SettingStateSuccess extends SettingState {
  final UserDetailsModel userDetails;
  SettingStateSuccess({
    required this.userDetails,
  });
}

class SettingStateError extends SettingState {
  final NetworkExceptions networkExceptions;

  SettingStateError(this.networkExceptions);
}

class SettingStateTheme extends SettingState {
  final ThemeData themeMode;

  SettingStateTheme({required this.themeMode});
}

class SwitchToDark extends SettingState {}

class SwitchToLight extends SettingState {}

class InitRive extends SettingState {}

class SettingStateNoInternet extends SettingState {
  bool isAlertSet;
  SettingStateNoInternet({
    required this.isAlertSet,
  });
}
