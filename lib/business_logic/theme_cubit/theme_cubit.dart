// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:imdb_demo/business_logic/favorite_cubit/favorite_cubit.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/account/profile_details_model.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../shared/constants/themes.dart';
import '../../shared/data/repo/account_repo/acc_repo.dart';
import '../../shared/web_services/errors/api_result.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<SettingStateTheme> {
  ThemeCubit() : super(SettingStateTheme(themeMode: AppTheme.lightTheme));
  bool isDark = false;
//SettingStateTheme(themeMode: AppTheme.lightTheme)
  toggleSwitch(bool value) {
    SettingStateTheme updatedState;
    if (state.themeMode == AppTheme.lightTheme) {
      saveTheme(value);

      updatedState = SettingStateTheme(themeMode: AppTheme.darkTheme);
      emit(updatedState);
    } else {
      saveTheme(value);

      updatedState = SettingStateTheme(themeMode: AppTheme.lightTheme);
      emit(updatedState);
    }
  }

  saveTheme(bool value) async {
    await SharedPrefs.addBoolToSF(darkThemeKey, value);
    print('saveTheme VAlUE $value');
  }

  bool? savedTheme;
  getSavedTheme() async {
    savedTheme = await SharedPrefs.getBoolValuesSF(darkThemeKey);
  }
}
