import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/constants/themes.dart';
import 'theme_state.dart';

class ThemeCubitCubit extends Cubit<SettingState> {
  ThemeCubitCubit() : super(SettingState(themeMode: AppTheme.lightTheme));
  bool isDark = false;

  toggleSwitch(bool value) {
    SettingState updatedState;
    if (state.themeMode == AppTheme.lightTheme) {
      saveTheme(value);

      updatedState = SettingState(themeMode: AppTheme.darkTheme);
      emit(updatedState);
    } else {
      saveTheme(value);

      updatedState = SettingState(themeMode: AppTheme.lightTheme);
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
