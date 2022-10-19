import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.idle() = Idle<T>;
  const factory ProfileState.loading() = Loading<T>;
  const factory ProfileState.success(T data) = Success<T>;
  const factory ProfileState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
