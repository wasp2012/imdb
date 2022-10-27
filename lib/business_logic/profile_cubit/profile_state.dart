import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../shared/data/models/account/favorite_model.dart';
import '../../shared/data/models/account/profile_details_model.dart';

@immutable
abstract class ProfileState {}

class ProfileStateIdle extends ProfileState {}

class ProfileStateLoading extends ProfileState {}

class ProfileStateSuccess extends ProfileState {
  final UserDetailsModel userDetails;

  ProfileStateSuccess(this.userDetails);
}

class ProfileStateError extends ProfileState {
  final NetworkExceptions networkExceptions;

  ProfileStateError(this.networkExceptions);
}

class FavoriteMoviesLoading extends ProfileState {}

class FavoriteMoviesSuccess extends ProfileState {
  final AllFavoriteModel allFavoriteModel;

  FavoriteMoviesSuccess(this.allFavoriteModel);
}

class FavoriteMoviesError extends ProfileState {
  final NetworkExceptions networkExceptions;

  FavoriteMoviesError(this.networkExceptions);
}
