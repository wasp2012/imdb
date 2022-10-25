import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

part 'movie_details_state.freezed.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.idle() = Idle;
  const factory MovieDetailsState.loading() = Loading;
  const factory MovieDetailsState.success(data) = Success;
  const factory MovieDetailsState.error(NetworkExceptions networkExceptions) =
      Error;
}
