import 'package:bloc/bloc.dart';
import 'package:imdb_demo/shared/data/repo/movies_repo/movies_repository.dart';

import '../../shared/data/models/movies/now_playing.dart';
import '../../shared/data/models/movies/popular.dart';
import '../../shared/data/models/movies/results.dart';
import '../../shared/data/models/movies/top_rated.dart';
import '../../shared/data/models/movies/upcoming.dart';
import '../../shared/web_services/errors/api_result.dart';
import '../../shared/web_services/errors/network_exceptions.dart';
import 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesRepository moviesRepository;

  MoviesCubit(
    this.moviesRepository,
  ) : super(const Idle());
  List<Results>? nowPlayingMoviesList = [];
  List<Results>? topRatedMoviesList = [];
  List<Results>? popularMoviesList = [];
  List<Results>? upComingMoviesList = [];

  Future<void> emitNowPlayingMovies() async {
    try {
      emit(const MoviesState.loading());

      ApiResult<NowPlayingMovieModel?> response =
          await moviesRepository.getMoviesPlayingNow();
      response.when(success: (nowPlayingMovieModel) {
        nowPlayingMoviesList = nowPlayingMovieModel!.results!.cast<Results>();
        emit(MoviesState.success(nowPlayingMovieModel));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(MoviesState.error(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> emitTopRatedMovies() async {
    try {
      emit(const MoviesState.loading());
      ApiResult<TopRatedMovieModel?> response =
          await moviesRepository.getMoviesTopRated();
      response.when(success: (topRatedMovies) {
        topRatedMoviesList = topRatedMovies!.results!.cast<Results>();
        emit(MoviesState.success(topRatedMovies));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(MoviesState.error(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> emitMoviesPopular() async {
    try {
      emit(const MoviesState.loading());
      ApiResult<PopularMovieModel?> response =
          await moviesRepository.getMoviesPopular();
      response.when(success: (popularMovies) {
        popularMoviesList = popularMovies!.results!.cast<Results>();
        emit(MoviesState.success(popularMovies));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(MoviesState.error(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> emitMoviesUpComing() async {
    try {
      emit(const MoviesState.loading());
      ApiResult<UpcomingMovieModel?> response =
          await moviesRepository.getMoviesUpComing();
      response.when(success: (upComingMovies) {
        upComingMoviesList = upComingMovies!.results!.cast<Results>();
        emit(MoviesState.success(upComingMovies));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(MoviesState.error(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
