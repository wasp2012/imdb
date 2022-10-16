import 'package:bloc/bloc.dart';
import 'package:imdb_demo/shared/data/models/movies/movie_details.dart';
import 'package:imdb_demo/shared/data/repo/movies_repo/movies_repository.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState<MovieDetailsModel>> {
  MoviesRepository moviesRepository;

  MovieDetailsCubit(
    this.moviesRepository,
  ) : super(const Idle());

  Future<void> emitMovieDetails(String id) async {
    MovieDetailsModel? movieDetailsModel;

    try {
      emit(const MovieDetailsState.loading());

      ApiResult<MovieDetailsModel?> response =
          await moviesRepository.getMovieDetails(id);

      response.when(success: (movieDetails) {
        movieDetailsModel = movieDetails!;
        emit(MovieDetailsState.success(movieDetails));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(MovieDetailsState.error(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
