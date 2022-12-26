import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/business_logic/favorite_cubit/favorite_cubit.dart';
import 'package:imdb_demo/presentation/screen/movies/movies_list_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../business_logic/movies_cubitt/movie_detail_cubit/movie_details_cubit.dart';
import '../business_logic/movies_cubitt/movies_cubit/movies_cubit.dart';
import '../injection.dart';
import '../presentation/screen/check_internet_screen.dart';
import '../presentation/screen/favorite_list_screen.dart';
import '../presentation/screen/home_screen.dart';
import '../presentation/screen/registration/log_in_screen.dart';
import '../presentation/screen/movies/movie_details_screen.dart';
import '../presentation/screen/profile_screen.dart';
import '../presentation/screen/registration/sign_up_webview_screen.dart';
import '../presentation/screen/settings_screen.dart';
import '../presentation/screen/watch_list_screen.dart';
import '../shared/common/custom_material_page_route.dart';
import '../shared/constants/strings.dart';
import '../shared/data/repo/movies_repo/movies_repository.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return CustomMaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: getIt<MoviesCubit>(),
              child: const HomeScreen(),
            );
          },
        );
      case movieDetailsScreen:
        return CustomMaterialPageRoute(
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
                movieId: movieId as dynamic,
              ),
            );
          },
        );

      case settingsScreen:
        return CustomMaterialPageRoute(
          builder: (context) {
            return const SettingsScreen();
          },
        );
      case logInScreen:
        return CustomMaterialPageRoute(
          builder: (context) {
            return const LogInScreen();
          },
        );
      case profileScreen:
        return CustomMaterialPageRoute(
          builder: (context) {
            return const ProfileScreen();
          },
        );
      case favoriteScreen:
        return CustomMaterialPageRoute(
          builder: (context) {
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
        return CustomMaterialPageRoute(
          builder: (context) {
            return const WatchListScreen();
          },
        );
      case checkInternetScreen:
        return CustomMaterialPageRoute(
          builder: (context) {
            return const CheckInternetScreen();
          },
        );
      case signUpWebViewScreen:
        return CustomMaterialPageRoute(
          builder: (context) {
            return const SignUpWebViewScreen();
          },
        );
      case moviesListScreen:
        return CustomMaterialPageRoute(
          builder: (context) {
            var cubit = settings.arguments as MoviesCubit;
            return BlocProvider.value(
              value: getIt<MoviesCubit>(),
              child: MoviesListScreen(cubit: cubit),
            );
          },
        );
    }

    return null;
  }
}
