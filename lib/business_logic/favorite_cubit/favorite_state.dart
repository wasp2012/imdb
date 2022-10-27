part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteStateLoading extends FavoriteState {}

class FavoriteStateIdle extends FavoriteState {}

class FavoriteStateSaved extends FavoriteState {
  final FavoriteModel favoriteModel;

  FavoriteStateSaved({
    required this.favoriteModel,
  });
}

class FavoriteStateRemoved extends FavoriteState {
  final FavoriteModel favoriteModel;

  FavoriteStateRemoved({
    required this.favoriteModel,
  });
}

class UserDetailsError extends FavoriteState {
  final NetworkExceptions networkExceptions;

  UserDetailsError(this.networkExceptions);
}

class UserDetailsLoading extends FavoriteState {}

class FavoriteStateError extends FavoriteState {
  final NetworkExceptions networkExceptions;

  FavoriteStateError(this.networkExceptions);
}
