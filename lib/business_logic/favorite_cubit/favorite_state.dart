// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class FavoriteMoviesLoading extends FavoriteState {}

class FavoriteMoviesSuccess extends FavoriteState {
  final AllFavoriteModel allFavoriteModel;

  FavoriteMoviesSuccess(this.allFavoriteModel);
}

class FavoriteMoviesError extends FavoriteState {
  final NetworkExceptions networkExceptions;

  FavoriteMoviesError(this.networkExceptions);
}

class MarkFavoriteIcon extends FavoriteState {
  IconData iconData;
  MarkFavoriteIcon({
    required this.iconData,
  });
}

class UnMarkFavoriteIcon extends FavoriteState {
  IconData iconData;
  UnMarkFavoriteIcon({
    required this.iconData,
  });
}

class AlreadyFavorite extends FavoriteState {}
