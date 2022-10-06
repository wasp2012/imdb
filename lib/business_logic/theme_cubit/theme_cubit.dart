import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:imdb_demo/injection.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import '../../shared/constants/themes.dart';
import 'theme_state.dart';

class ThemeCubitCubit extends Cubit<SettingState> {
  ThemeCubitCubit() : super(SettingState(themeMode: AppTheme.lightTheme));
  bool isDark = false;
  bool? myThemeValue;

  Future<void> toggleSwitch(bool value) async {
    if (state.themeMode == AppTheme.lightTheme) {
      var updatedState = SettingState(themeMode: AppTheme.darkTheme);
      SharedPref.setBool(isDarkTheme, true);
      emit(updatedState);
    } else {
      var updatedState = SettingState(themeMode: AppTheme.lightTheme);
      SharedPref.setBool(isDarkTheme, false);
      emit(updatedState);
    }
  }

  Future<void> themeSwap() async {}
}
