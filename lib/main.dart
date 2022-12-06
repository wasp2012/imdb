// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb_demo/business_logic/auth_cubit/authentication_cubit.dart';
import 'package:imdb_demo/business_logic/favorite_cubit/favorite_cubit.dart';
import 'package:imdb_demo/business_logic/internet_cubit/internet_cubit.dart';
import 'package:imdb_demo/business_logic/profile_cubit/profile_cubit.dart';
import 'package:imdb_demo/presentation/screen/check_internet_screen.dart';
import 'package:imdb_demo/presentation/widget/curved_bottom_navbar_widget.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/constants/themes.dart';
import 'package:imdb_demo/shared/offline_data.dart';

import 'bloc_observer.dart';
import 'business_logic/theme_cubit/settings_cubit.dart';
import 'business_logic/theme_cubit/settings_state.dart';
import 'injection.dart';
import 'route/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
// Initialize Firebase.
  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  Bloc.observer = MyBlocObserver();

  var isUserLoggedIn = await SharedPrefs.checkValue(userTokenKey);
  Future.delayed(const Duration(seconds: 4));
  runApp(MyApp(
    router: AppRouter(),
    home: isUserLoggedIn == true ? homeScreen : logInScreen,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    this.router,
    this.home,
  }) : super(key: key);

  final AppRouter? router;
  final String? home;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FutureBuilder(
      future: Future.wait([getIt.allReady()]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final cubitThemeCubit = getIt<SettingsCubit>();

          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<SettingsCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<AuthenticationCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<FavoriteCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<ProfileCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<InternetCubit>(),
                ),
              ],
              child: BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                if (state is InternetDisconnected) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    darkTheme: AppTheme.darkTheme,
                    theme: AppTheme.lightTheme,
                    themeMode: cubitThemeCubit.savedTheme == true
                        ? ThemeMode.dark
                        : ThemeMode.light,
                    home: const CheckInternetScreen(),
                  );
                } else if (state is InternetConnected) {
                  return BlocBuilder<SettingsCubit, SettingState>(
                    builder: (context, state) {
                      return ScreenUtilInit(
                          designSize: const Size(360, 690),
                          minTextAdapt: true,
                          splitScreenMode: true,
                          builder: (context, child) {
                            return SafeArea(
                              child: MaterialApp(
                                debugShowCheckedModeBanner: false,
                                darkTheme: AppTheme.darkTheme,
                                theme: AppTheme.lightTheme,
                                themeMode: cubitThemeCubit.savedTheme == true
                                    ? ThemeMode.dark
                                    : ThemeMode.light,
                                initialRoute: home,
                                onGenerateRoute: router?.onGenerateRoute,
                              ),
                            );
                          });
                    },
                  );
                } else {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    darkTheme: AppTheme.darkTheme,
                    theme: AppTheme.lightTheme,
                    themeMode: cubitThemeCubit.savedTheme == true
                        ? ThemeMode.dark
                        : ThemeMode.light,
                    home: const Center(child: CircularProgressIndicator()),
                  );
                }
              }));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
