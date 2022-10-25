import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../shared/data/models/movies/movies_id/movies_video_by_id_model.dart';

part 'video_for_movie_state.freezed.dart';

@freezed
class VideoForMovieState with _$VideoForMovieState {
  const factory VideoForMovieState.idle() = Idle;
  const factory VideoForMovieState.loading() = Loading;
  const factory VideoForMovieState.success(MovieVideoById data) = Success;
  const factory VideoForMovieState.error(NetworkExceptions networkExceptions) =
      Error;
}
