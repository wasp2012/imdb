// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:imdb_demo/shared/data/models/movies/movies_id/movies_video_by_id_model.dart';
import 'package:imdb_demo/shared/data/repo/movies_repo/movies_repository.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'video_for_movie_state.dart';

class VideoForMovieCubit extends Cubit<VideoForMovieState> {
  final MoviesRepository? moviesRepository;

  PlayerState? playerState = null;
  YoutubeMetaData? videoMetaData = null;

  final bool isPlayerReady = false;
  YoutubePlayerController controller =
      YoutubePlayerController(initialVideoId: '');

  VideoForMovieCubit(
    this.moviesRepository,
  ) : super(VideoForMovieStateIdle());
  List<VideoForMovieResult>? videoForMovieResultsList = [];

  Future<void> getMovieVideos(String id) async {
    emit(VideoForMovieStateLoading());

    try {
      ApiResult<MovieVideoById?> response =
          await moviesRepository!.getMovieVideos(id);

      response.when(success: (videoResults) {
        videoForMovieResultsList = videoResults!.results ?? [];
        emit(VideoForMovieStateSuccess(videoResults));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(VideoForMovieStateError(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  listener() {
    playerState = controller.value.playerState;
    videoMetaData = controller.metadata;
    emit(AddingListenerSucceeded());
  }
}
