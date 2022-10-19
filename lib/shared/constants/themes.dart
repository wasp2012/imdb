import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xffE0E4EE);
  static Color lightPrimaryColor = const Color(0xff5BD3C7);
  static Color lightAccentColor = Colors.blueGrey.shade400;
  static Color lightParticlesColor = const Color(0xffFFFFFF);
  static Color lightButtonColor = const Color(0xff1f4287);
  static Color lightHoverColor = const Color(0xffdee1ec);

  static TextTheme lightTextTheme = TextTheme(
    headline1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    headline2: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
    bodyText2: TextStyle(
        color: Color.fromARGB(255, 105, 104, 104), fontWeight: FontWeight.w500),
    subtitle1: TextStyle(color: Colors.grey),
  );

  static Color darkBackgroundColor = const Color.fromARGB(255, 27, 27, 27);
  static Color darkPrimaryColor = const Color(0xff1a2127);
  static Color darkAccentColor = const Color(0xff000000);
  static Color darkParticlesColor = const Color(0x441c2a3d);
  static Color darkButtonColor = const Color(0xfffc5185);
  static Color darkHoverColor = const Color(0xff0e153a);

  static TextTheme darkTextTheme = TextTheme(
    headline1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    headline2: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
    bodyText2: TextStyle(
        color: Color.fromARGB(255, 165, 164, 164), fontWeight: FontWeight.w500),
    subtitle1: TextStyle(color: Colors.blueGrey),
  );

  const AppTheme._();
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    backgroundColor: lightBackgroundColor,
    accentColor: lightAccentColor,
    buttonColor: lightButtonColor,
    textTheme: lightTextTheme,
    hoverColor: lightHoverColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    backgroundColor: darkBackgroundColor,
    accentColor: darkAccentColor,
    buttonColor: darkButtonColor,
    textTheme: darkTextTheme,
    hoverColor: darkHoverColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? lightBackgroundColor
          : darkBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}

extension ThemeExtras on ThemeData {
  Color get particlesColor => this.brightness == Brightness.light
      ? AppTheme.lightParticlesColor
      : AppTheme.darkParticlesColor;
}
