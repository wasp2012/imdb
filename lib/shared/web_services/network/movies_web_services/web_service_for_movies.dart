import 'package:dio/dio.dart';
import '../../../data/models/movies/movie_details.dart';
import '../../../data/models/movies/movies_id/movies_video_by_id_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../constants/apis.dart';
import '../../../data/models/movies/now_playing.dart';
import '../../../data/models/movies/popular.dart';
import '../../../data/models/movies/top_rated.dart';
import '../../../data/models/movies/upcoming.dart';
import '../../errors/api_result.dart';

part 'web_service_for_movies.g.dart';

@RestApi(baseUrl: ApisUrl.baseurlForMovies)
abstract class WebServicesForMovies {
  factory WebServicesForMovies(Dio dio, {String baseUrl}) =
      _WebServicesForMovies;

  @GET('/now_playing')
  Future<NowPlayingMovieModel> getMoviesPlayingNow(
    @Query('api_key') String apiKey,
  );
  @GET('/popular')
  Future<PopularMovieModel> getMoviesPopular(
    @Query('api_key') String apiKey,
  );

  @GET('/top_rated')
  Future<TopRatedMovieModel> getMoviesTopRated(
    @Query('api_key') String apiKey,
  );

  @GET('/upcoming')
  Future<UpcomingMovieModel> getMoviesUpComing(
    @Query('api_key') String apiKey,
  );
  @GET('/{id}')
  Future<MovieDetailsModel> getMovieDetails(
    @Query('api_key') String apiKey,
    @Path() String id,
  );

  @GET('/{movie_id}/videos')
  Future<MovieVideoById> getMovieVideos(
    @Query('api_key') String apiKey,
    @Path('movie_id') String id,
  );
}
