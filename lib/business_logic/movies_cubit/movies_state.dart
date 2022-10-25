import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/web_services/errors/network_exceptions.dart';

part 'movies_state.freezed.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState.idle() = Idle;
  const factory MoviesState.loading() = Loading;
  const factory MoviesState.success(data) = Success;
  const factory MoviesState.error(NetworkExceptions networkExceptions) = Error;
}
