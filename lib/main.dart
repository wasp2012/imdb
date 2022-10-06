import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/constants/themes.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'business_logic/theme_cubit/theme_cubit.dart';
import 'business_logic/theme_cubit/theme_state.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc_observer.dart';
import 'business_logic/movies_cubit/movies_cubit.dart';
import 'business_logic/movies_cubit/movies_state.dart';
import 'injection.dart';
import 'route/router.dart';

void main() async {
  initGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    router: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<ThemeCubitCubit>();
    return BlocProvider(
      create: (context) => getIt<ThemeCubitCubit>(),
      child: BlocBuilder<ThemeCubitCubit, SettingState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                cubit.isDark == true ? AppTheme.darkTheme : AppTheme.lightTheme,
            // AppTheme.darkTheme ,
            onGenerateRoute: router.onGenerateRoute,
          );
        },
      ),
    );
  }
}
