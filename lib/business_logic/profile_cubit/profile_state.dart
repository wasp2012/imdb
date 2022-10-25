import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.idle() = Idle;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success(data) = Success;
  const factory ProfileState.error(NetworkExceptions networkExceptions) = Error;
}
