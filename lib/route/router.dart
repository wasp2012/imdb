import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection.dart';
import '../presentation/screen/favorite_list_screen.dart';
import '../presentation/screen/home_screen.dart';
import '../presentation/screen/log_in_screen.dart';
import '../presentation/screen/movie_details_screen.dart';
import '../presentation/screen/profile_screen.dart';
import '../presentation/screen/settings_screen.dart';
import '../presentation/screen/watch_list_screen.dart';
import '../shared/constants/strings.dart';

import '../business_logic/movie_detail_cubit/movie_details_cubit.dart';
import '../business_logic/movies_cubit/movies_cubit.dart';
import '../business_logic/video_for_movie_cubit/video_for_movie_cubit.dart';
import '../presentation/screen/movie_videos_screen.dart';
import '../shared/data/repo/movies_repo/movies_repository.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: getIt<MoviesCubit>(),
              child: const HomeScreen(),
            );
          },
        );
      case movieDetailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            var movieId = settings.arguments;
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      MovieDetailsCubit(getIt<MoviesRepository>()),
                ),
              ],
              child: MovieDetailsScreen(
                movieId: movieId as String,
              ),
            );
          },
        );
      case videoScreen:
        return MaterialPageRoute(
          builder: (context) {
            var movieId = settings.arguments;

            return BlocProvider(
              create: (context) => getIt<VideoForMovieCubit>(),
              child: MovieVideosScreen(
                movieId: movieId as String,
              ),
            );
          },
        );
      case settingsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const SettingsScreen();
          },
        );
      case logInScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const LogInScreen();
          },
        );
      case profileScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const ProfileScreen();
          },
        );
      case favoriteScreen:
        return MaterialPageRoute(
          builder: (context) {
            var movieId = settings.arguments;

            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      MovieDetailsCubit(getIt<MoviesRepository>()),
                ),
              ],
              child: const FavoriteScreen(),
            );
          },
        );
      case watchListScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const WatchListScreen();
          },
        );
    }
    return null;
  }
}
