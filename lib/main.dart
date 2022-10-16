import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:imdb_demo/business_logic/auth_cubit/authentication_cubit.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/constants/themes.dart';
import 'package:imdb_demo/shared/data/models/authentication/login_model.dart';
import 'package:imdb_demo/shared/data/models/authentication/req_token.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'business_logic/theme_cubit/theme_cubit.dart';
import 'business_logic/theme_cubit/theme_state.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc_observer.dart';
import 'business_logic/movies_cubit/movies_cubit.dart';
import 'business_logic/movies_cubit/movies_state.dart';
import 'injection.dart';
import 'route/router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  initGetIt();

  Bloc.observer = MyBlocObserver();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp(
    router: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.router});

  final AppRouter router;

  bool isUserTokenSaved = false;
  void checkUserTokenSaved(String key) async {
    if (await SharedPrefs.checkValue(key)) {
      isUserTokenSaved = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final cubitThemeCubit = getIt<ThemeCubitCubit>();

          print(cubitThemeCubit.savedTheme);
          FlutterNativeSplash.remove();
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ThemeCubitCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<RequestTokenCubit>(),
              ),
            ],
            child: BlocBuilder<ThemeCubitCubit, SettingState>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  darkTheme: AppTheme.darkTheme,
                  theme: AppTheme.lightTheme,
                  themeMode: cubitThemeCubit.savedTheme == true
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  initialRoute:
                      isUserTokenSaved == true ? homeScreen : logInScreen,
                  onGenerateRoute: router.onGenerateRoute,
                );
              },
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
