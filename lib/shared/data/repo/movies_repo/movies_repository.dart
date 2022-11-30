import '../../../constants/apis.dart';
import '../../../web_services/errors/api_result.dart';
import '../../../web_services/errors/network_exceptions.dart';
import '../../models/movies/movie_details.dart';
import '../../models/movies/movies_id/movies_video_by_id_model.dart';
import '../../models/movies/now_playing.dart';
import '../../models/movies/popular.dart';
import '../../models/movies/top_rated.dart';
import '../../models/movies/upcoming.dart';
import 'movies_repo_interface.dart';

class MoviesRepository extends MoviesRepositoryInterface {
  @override
  Future<ApiResult<NowPlayingMovieModel?>> getMoviesPlayingNow() async {
    try {
      var response = await webServicesForMovies?.getMoviesPlayingNow(
        ApisUrl.apiKey,
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
  Future<ApiResult<PopularMovieModel?>> getMoviesPopular() async {
    try {
      var response = await webServicesForMovies?.getMoviesPopular(
        ApisUrl.apiKey,
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
  Future<ApiResult<TopRatedMovieModel?>> getMoviesTopRated() async {
    try {
      var response = await webServicesForMovies?.getMoviesTopRated(
        ApisUrl.apiKey,
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
  Future<ApiResult<UpcomingMovieModel?>> getMoviesUpComing() async {
    try {
      var response = await webServicesForMovies?.getMoviesUpComing(
        ApisUrl.apiKey,
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
  Future<ApiResult<MovieDetailsModel?>> getMovieDetails(String id) async {
    try {
      var response = await webServicesForMovies?.getMovieDetails(
        ApisUrl.apiKey,
        id,
      );

      return ApiResult.success(response);
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
        ApisUrl.apiKey,
        id,
      );
      return ApiResult.success(response);
    } catch (error) {
      print(error);
      return ApiResult.failure(
        NetworkExceptions.getDioException(error),
      );
    }
  }
}
