import 'package:dio/dio.dart';
import '../../../constants/apis.dart';
import '../../models/movies/movie_details.dart';
import '../../models/movies/movies_id/movies_video_by_id_model.dart';
import '../../models/movies/now_playing.dart';
import '../../models/movies/popular.dart';
import '../../models/movies/top_rated.dart';
import '../../models/movies/upcoming.dart';
import '../../../web_services/errors/api_result.dart';
import '../../../web_services/network/movies_web_services/web_service_for_movies.dart';

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
