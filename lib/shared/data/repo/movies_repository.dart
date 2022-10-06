import 'dart:convert';

import 'package:imdb_demo/shared/constants/apis.dart';
import 'package:imdb_demo/shared/data/models/movies/movies_id/movies_video_by_id_model.dart';
import 'package:imdb_demo/shared/data/models/movies/now_playing.dart';
import 'package:imdb_demo/shared/data/models/movies/popular.dart';
import 'package:imdb_demo/shared/data/models/movies/top_rated.dart';
import 'package:imdb_demo/shared/data/models/movies/upcoming.dart';
import 'package:imdb_demo/shared/data/repo/movies_repo_interface.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../web_services/errors/api_result.dart';
import '../models/movies/movie_details.dart';

class MoviesRepository extends MoviesRepositoryInterface {
  @override
  Future<ApiResult<NowPlayingMovieModel>> getMoviesPlayingNow() async {
    try {
      var response = await webServicesForMovies?.getMoviesPlayingNow(
        ApisUrl.token,
      );

      // print(jsonEncode(response));
      return ApiResult.success(response!);
    } catch (error) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(
          error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<PopularMovieModel?>> getMoviesPopular() async {
    try {
      var response = await webServicesForMovies?.getMoviesPopular(
        ApisUrl.token,
      );

      // print(jsonEncode(response));
      return ApiResult.success(response!);
    } catch (error) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(
          error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<TopRatedMovieModel?>> getMoviesTopRated() async {
    try {
      var response = await webServicesForMovies?.getMoviesTopRated(
        ApisUrl.token,
      );

      // print(jsonEncode(response));
      return ApiResult.success(response!);
    } catch (error) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(
          error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<UpcomingMovieModel?>> getMoviesUpComing() async {
    try {
      var response = await webServicesForMovies?.getMoviesUpComing(
        ApisUrl.token,
      );

      // print(jsonEncode(response));
      return ApiResult.success(response!);
    } catch (error) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(
          error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<MovieDetailsModel?>> getMovieDetails(String id) async {
    try {
      var response = await webServicesForMovies?.getMovieDetails(
        ApisUrl.token,
        id,
      );

      return ApiResult.success(response!);
    } catch (error) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(
          error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<MovieVideoById?>> getMovieVideos(String id) async {
    try {
      var response = await webServicesForMovies?.getMovieVideos(
        ApisUrl.token,
        id,
      );
      print(jsonEncode(response));
      return ApiResult.success(response);
    } catch (error) {
      print(error);
      return ApiResult.failure(
        NetworkExceptions.getDioException(error),
      );
    }
  }
}
