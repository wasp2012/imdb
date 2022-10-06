import 'package:dio/dio.dart';
import 'package:imdb_demo/shared/constants/apis.dart';
import 'package:imdb_demo/shared/data/models/movies/now_playing.dart';
import 'package:imdb_demo/shared/data/models/movies/popular.dart';
import 'package:imdb_demo/shared/data/models/movies/top_rated.dart';
import 'package:imdb_demo/shared/data/models/movies/upcoming.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/network/web_service_for_movies.dart';

import '../models/movies/movie_details.dart';
import '../models/movies/movies_id/movies_video_by_id_model.dart';

abstract class MoviesRepositoryInterface {
  Dio? dio = Dio();
  WebServicesForMovies? webServicesForMovies;
  MoviesRepositoryInterface() {
    webServicesForMovies =
        WebServicesForMovies(dio!, baseUrl: ApisUrl.baseurlForMovies);
  }

  Future<ApiResult<NowPlayingMovieModel?>> getMoviesPlayingNow();
  Future<ApiResult<PopularMovieModel?>> getMoviesPopular();
  Future<ApiResult<TopRatedMovieModel?>> getMoviesTopRated();
  Future<ApiResult<UpcomingMovieModel?>> getMoviesUpComing();
  Future<ApiResult<MovieDetailsModel?>> getMovieDetails(String id);
  Future<ApiResult<MovieVideoById?>> getMovieVideos(String id);
}
