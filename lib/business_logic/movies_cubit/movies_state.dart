import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/web_services/errors/network_exceptions.dart';

part 'movies_state.freezed.dart';

@freezed
class MoviesState<T> with _$MoviesState<T> {
  const factory MoviesState.idle() = Idle<T>;
  const factory MoviesState.loading() = Loading<T>;
  const factory MoviesState.success(T data) = Success<T>;
  const factory MoviesState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
