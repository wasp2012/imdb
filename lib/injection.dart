import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imdb_demo/shared/data/repo/movies_repository.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'package:imdb_demo/shared/web_services/network/web_service_for_movies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'business_logic/theme_cubit/theme_cubit.dart';
import 'business_logic/video_for_movie_cubit/video_for_movie_cubit.dart';

import 'route/router.dart';

import 'business_logic/movie_detail_cubit/movie_details_cubit.dart';
import 'business_logic/movies_cubit/movies_cubit.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.allowReassignment = true;

  getIt.registerLazySingleton<WebServicesForMovies>(
      () => WebServicesForMovies(createAndSetupDio()));

  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepository());

//Cubits
  getIt.registerFactory<NowPLayingMoviesCubit>(
      () => NowPLayingMoviesCubit(getIt<MoviesRepository>()));

  getIt.registerFactory<TopRatedMoviesCubit>(
      () => TopRatedMoviesCubit(getIt<MoviesRepository>()));

  getIt.registerFactory<PopularMoviesCubit>(
      () => PopularMoviesCubit(getIt<MoviesRepository>()));

  getIt.registerFactory<UpcomingMoviesCubit>(
      () => UpcomingMoviesCubit(getIt<MoviesRepository>()));

  getIt.registerFactory<MovieDetailsCubit>(
      () => MovieDetailsCubit(getIt<MoviesRepository>()));

  getIt.registerFactory<VideoForMovieCubit>(
      () => VideoForMovieCubit(getIt<MoviesRepository>()));

  getIt.registerSingleton<ThemeCubitCubit>(ThemeCubitCubit());
  //

  getIt.registerLazySingleton<AppRouter>(() => AppRouter());

// Alternatively you could write it if you don't like global variables
//   GetIt.I.registerSingleton<MoviesCubit>(MoviesCubit());
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = 60 * 1000
    ..options.receiveTimeout = 60 * 1000;

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}
