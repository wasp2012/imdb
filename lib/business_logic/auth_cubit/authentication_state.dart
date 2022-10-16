import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState<T> with _$AuthenticationState<T> {
  const factory AuthenticationState.idle() = Idle<T>;
  const factory AuthenticationState.loading() = Loading<T>;
  const factory AuthenticationState.success(T data) = Success<T>;
  const factory AuthenticationState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
