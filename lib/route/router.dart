// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/injection.dart';
import 'package:imdb_demo/presentation/screen/home_screen.dart';
import 'package:imdb_demo/presentation/screen/movie_details_screen.dart';
import 'package:imdb_demo/presentation/screen/settings_screen.dart';
import 'package:imdb_demo/shared/constants/strings.dart';

import '../business_logic/movie_detail_cubit/movie_details_cubit.dart';
import '../business_logic/movies_cubit/movies_cubit.dart';
import '../business_logic/theme_cubit/theme_cubit.dart';
import '../presentation/screen/movie_videos_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<NowPLayingMoviesCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<TopRatedMoviesCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<PopularMoviesCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<UpcomingMoviesCubit>(),
              ),
            ],
            child: HomeScreen(),
          ),
        );
      case movieDetailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            var movieId = settings.arguments;
            return MovieDetailsScreen(
              movieId: movieId as String,
            );
          },
        );
      case videoScreen:
        return MaterialPageRoute(
          builder: (context) {
            var movieId = settings.arguments;

            return MovieVideosScreen(
              movieId: movieId as String,
            );
          },
        );
      case settingsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt<ThemeCubitCubit>(),
              child: SettingsScreen(),
            );
          },
        );
    }
  }
}
