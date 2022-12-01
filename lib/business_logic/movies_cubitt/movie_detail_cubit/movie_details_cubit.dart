// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:imdb_demo/shared/data/repo/movies_repo/movies_repository.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../../shared/data/models/movies/movie_details.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MoviesRepository? moviesRepository;

  MovieDetailsCubit(
    this.moviesRepository,
  ) : super(MovieDetailsIdle());
  MovieDetailsModel? movieDetailsModel;

  Future<void> emitMovieDetails(String id) async {
    try {
      emit(MovieDetailsLoading());

      ApiResult<MovieDetailsModel?> response =
          await moviesRepository!.getMovieDetails(id);

      response.when(success: (movieDetailsResult) {
        movieDetailsModel = movieDetailsResult!;
        emit(MovieDetailsSuccess(
          movieDetailsModel: movieDetailsResult,
        ));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(MovieDetailsError(
          networkExceptions: networkExceptions,
        ));
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
