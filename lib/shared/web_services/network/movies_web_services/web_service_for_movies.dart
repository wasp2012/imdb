import 'package:dio/dio.dart';
import '../../../data/models/movies/searched_movies.dart';
import 'package:retrofit/retrofit.dart';

import '../../../constants/apis.dart';
import '../../../data/models/movies/movie_details.dart';
import '../../../data/models/movies/movies_id/movies_video_by_id_model.dart';
import '../../../data/models/movies/now_playing.dart';
import '../../../data/models/movies/popular.dart';
import '../../../data/models/movies/top_rated.dart';
import '../../../data/models/movies/upcoming.dart';

part 'web_service_for_movies.g.dart';

@RestApi(baseUrl: ApisUrl.baseurlForMovies)
abstract class WebServicesForMovies {
  factory WebServicesForMovies(Dio dio, {String baseUrl}) =
      _WebServicesForMovies;

  @GET('/movie/now_playing')
  Future<NowPlayingMovieModel> getMoviesPlayingNow(
    @Query('api_key') String apiKey,
  );
  @GET('/movie/popular')
  Future<PopularMovieModel> getMoviesPopular(
    @Query('api_key') String apiKey,
  );

  @GET('/movie/top_rated')
  Future<TopRatedMovieModel> getMoviesTopRated(
    @Query('api_key') String apiKey,
  );

  @GET('/movie/upcoming')
  Future<UpcomingMovieModel> getMoviesUpComing(
    @Query('api_key') String apiKey,
  );
  @GET('/movie/{id}')
  Future<MovieDetailsModel> getMovieDetails(
    @Query('api_key') String apiKey,
    @Path() String id,
  );

  @GET('/movie/{movie_id}/videos')
  Future<MovieVideoById> getMovieVideos(
    @Query('api_key') String apiKey,
    @Path('movie_id') String id,
  );

  @GET('/search/movie')
  Future<SearchedMovies> getSearchedMovies(
    @Query('api_key') String apiKey,
    @Query('query') String query,
  );
}
