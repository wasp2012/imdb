import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

part 'movie_details_state.freezed.dart';

@freezed
class MovieDetailsState<T> with _$MovieDetailsState<T> {
  const factory MovieDetailsState.idle() = Idle<T>;
  const factory MovieDetailsState.loading() = Loading<T>;
  const factory MovieDetailsState.success(T data) = Success<T>;
  const factory MovieDetailsState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
