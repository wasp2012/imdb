import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/business_logic/auth_cubit/authentication_cubit.dart';
import 'package:imdb_demo/business_logic/favorite_cubit/favorite_cubit.dart';
import 'package:imdb_demo/business_logic/profile_cubit/profile_cubit.dart';
import 'package:imdb_demo/injection.dart';
import 'package:imdb_demo/presentation/screen/favorite_list_screen.dart';
import 'package:imdb_demo/presentation/screen/home_screen.dart';
import 'package:imdb_demo/presentation/screen/log_in_screen.dart';
import 'package:imdb_demo/presentation/screen/movie_details_screen.dart';
import 'package:imdb_demo/presentation/screen/profile_screen.dart';
import 'package:imdb_demo/presentation/screen/settings_screen.dart';
import 'package:imdb_demo/presentation/screen/watch_list_screen.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:provider/provider.dart';

import '../business_logic/movie_detail_cubit/movie_details_cubit.dart';
import '../business_logic/movies_cubit/movies_cubit.dart';
import '../business_logic/theme_cubit/theme_cubit.dart';
import '../business_logic/video_for_movie_cubit/video_for_movie_cubit.dart';
import '../presentation/screen/movie_videos_screen.dart';
import '../shared/data/repo/account_repo/acc_repo.dart';
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
                BlocProvider(
                  create: (context) => ProfileCubit(
                    (getIt<AccountRepository>()),
                  ),
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
            return BlocProvider(
              create: (context) => getIt<ProfileCubit>(),
              child: const ProfileScreen(),
            );
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
  }
}
