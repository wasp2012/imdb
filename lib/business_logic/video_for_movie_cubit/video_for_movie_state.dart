import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

part 'video_for_movie_state.freezed.dart';

@freezed
class VideoForMovieState<T> with _$VideoForMovieState<T> {
  const factory VideoForMovieState.idle() = Idle<T>;
  const factory VideoForMovieState.loading() = Loading<T>;
  const factory VideoForMovieState.success(T data) = Success<T>;
  const factory VideoForMovieState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
