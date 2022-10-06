import 'package:dio/dio.dart';
import 'package:imdb_demo/shared/data/models/movies/movie_details.dart';
import 'package:imdb_demo/shared/data/models/movies/movies_id/movies_video_by_id_model.dart';
import 'package:retrofit/http.dart';
import 'package:imdb_demo/shared/constants/apis.dart';
import 'package:imdb_demo/shared/data/models/movies/now_playing.dart';
import 'package:imdb_demo/shared/data/models/movies/popular.dart';
import 'package:imdb_demo/shared/data/models/movies/top_rated.dart';
import 'package:imdb_demo/shared/data/models/movies/upcoming.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';

part 'web_service_for_movies.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3/movie')
abstract class WebServicesForMovies {
  factory WebServicesForMovies(Dio dio, {String baseUrl}) =
      _WebServicesForMovies;

  @GET('/now_playing')
  Future<NowPlayingMovieModel> getMoviesPlayingNow(
    @Query('api_key') String apiKey,
    // @Query('language') String language,
    // @Query('page') String page
  );
  @GET('/popular')
  Future<PopularMovieModel> getMoviesPopular(
    @Query('api_key') String apiKey,
    // @Query('language') String language,
    // @Query('page') String page
  );

  @GET('/top_rated')
  Future<TopRatedMovieModel> getMoviesTopRated(
    @Query('api_key') String apiKey,
    // @Query('language') String language,
    // @Query('page') String page
  );

  @GET('/upcoming')
  Future<UpcomingMovieModel> getMoviesUpComing(
    @Query('api_key') String apiKey,
    // @Query('language') String language,
    // @Query('page') String page
  );
  @GET('/{id}')
  Future<MovieDetailsModel> getMovieDetails(
    @Query('api_key') String apiKey,
    @Path() String id,
    // @Query('page') String page
  );

  @GET('/{movie_id}/videos')
  Future<MovieVideoById> getMovieVideos(
    @Query('api_key') String apiKey,
    @Path('movie_id') String id,
    // @Query('page') String page
  );
}
