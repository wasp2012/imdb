// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:imdb_demo/presentation/widget/plasma.dart';
import 'package:lottie/lottie.dart';

import 'package:imdb_demo/business_logic/auth_cubit/authentication_cubit.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/constants/themes.dart';

import 'package:imdb_demo/shared/offline_data.dart';

import 'bloc_observer.dart';
import 'package:page_transition/page_transition.dart';

import 'business_logic/theme_cubit/theme_cubit.dart';
import 'business_logic/theme_cubit/theme_state.dart';
import 'injection.dart';
import 'route/router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  initGetIt();

  Bloc.observer = MyBlocObserver();

  var isUserLoggedIn = await SharedPrefs.checkValue(userTokenKey);
  runApp(MyApp(
    router: AppRouter(),
    home: isUserLoggedIn == true ? homeScreen : logInScreen,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({required this.router, required this.home, Key? key}) : super(key: key);

  final AppRouter router;
  final String home;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final cubitThemeCubit = getIt<ThemeCubit>();

          print(cubitThemeCubit.savedTheme);
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ThemeCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<AuthenticationCubit>(),
              ),
            ],
            child: BlocBuilder<ThemeCubit, SettingStateTheme>(
              builder: (context, state) {
                return ScreenUtilInit(
                    designSize: const Size(360, 690),
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (context, child) {
                      return MaterialApp(
                        debugShowCheckedModeBanner: false,
                        darkTheme: AppTheme.darkTheme,
                        theme: AppTheme.lightTheme,
                        themeMode: cubitThemeCubit.savedTheme == true
                            ? ThemeMode.dark
                            : ThemeMode.light,
                        initialRoute: home,
                        onGenerateRoute: router.onGenerateRoute,
                      );
                    });
              },
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
