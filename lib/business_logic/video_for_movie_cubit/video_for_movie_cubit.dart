// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/data/models/movies/movies_id/movies_video_by_id_model.dart';
import 'package:imdb_demo/shared/data/repo/movies_repository.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import 'video_for_movie_state.dart';

class VideoForMovieCubit extends Cubit<VideoForMovieState<MovieVideoById>> {
  MoviesRepository moviesRepository;
  VideoForMovieCubit(
    this.moviesRepository,
  ) : super(const Idle());

  Future<void> getMovieVideos(String id) async {
    MovieVideoById videoForMovieResultsList;

    try {
      emit(const VideoForMovieState.loading());
      ApiResult<MovieVideoById?> response =
          await moviesRepository.getMovieVideos(id);

      response.when(success: (videoResults) {
        videoForMovieResultsList = videoResults!;
        emit(VideoForMovieState.success(videoResults));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(VideoForMovieState.error(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
