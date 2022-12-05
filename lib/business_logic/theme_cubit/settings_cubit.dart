// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:imdb_demo/shared/common/animation_enum.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'package:rive/rive.dart';

import '../../shared/constants/themes.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingState> {
  SettingsCubit() : super(SettingStateIdle()) {
    SettingStateTheme(themeMode: AppTheme.lightTheme);
  }

  //DarkMode theme
  toggleSwitch(bool value) {
    SettingStateTheme? updatedState;
    if (updatedState?.themeMode == AppTheme.lightTheme) {
      saveTheme(value);
      emit(SettingStateTheme(themeMode: AppTheme.darkTheme));
    } else {
      saveTheme(value);
      emit(SettingStateTheme(themeMode: AppTheme.lightTheme));
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

  //Rive Animation
  late RiveAnimationController switchNightController;
  late RiveAnimationController dayIdleController;
  late RiveAnimationController nightIdleController;
  late RiveAnimationController switchDayController;
  Artboard? riveArtBoard;

  void removeAllControllers() {
    riveArtBoard?.artboard.removeController(switchNightController);
    riveArtBoard?.artboard.removeController(dayIdleController);
    riveArtBoard?.artboard.removeController(nightIdleController);
    riveArtBoard?.artboard.removeController(switchDayController);
  }

  void addDayIdleController() {
    removeAllControllers();

    riveArtBoard?.artboard.addController(dayIdleController);
    debugPrint("idleee day");
  }

  void addNightIdleController() {
    removeAllControllers();

    riveArtBoard?.artboard.addController(nightIdleController);
    debugPrint("idleee night");
  }

  void addSwitchNightController() {
    removeAllControllers();

    riveArtBoard?.artboard.addController(switchNightController);
    debugPrint("switch night");
  }

  void addSwitchDayController() {
    removeAllControllers();

    riveArtBoard?.artboard.addController(switchDayController);
    debugPrint("switch day");
  }

  void switchToDark() {
    addSwitchNightController();

    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        addNightIdleController();
      },
    );
  }

  void switchToLight() {
    addSwitchDayController();

    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        addDayIdleController();
      },
    );
  }

  void settingUpTheArtBoard() {
    switchNightController = SimpleAnimation(AnimationEnum.switch_night.name);

    dayIdleController = SimpleAnimation(AnimationEnum.day_idle.name);

    nightIdleController = SimpleAnimation(AnimationEnum.night_idle.name);

    switchDayController = SimpleAnimation(AnimationEnum.switch_day.name);

    rootBundle.load('assets/images/theme_switch.riv').then((data) {
      final file = RiveFile.import(data);
      final artBoard = file.mainArtboard;

      artBoard.addController(
          savedTheme == true ? nightIdleController : dayIdleController);

      riveArtBoard = artBoard;
      emit(InitRive());
    });
  }

  
}
