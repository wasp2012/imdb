// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../shared/data/models/account/favorite_model.dart';
import '../../shared/data/models/account/profile_details_model.dart';
import '../../shared/data/models/movies/movie_details.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsIdle extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsError extends MovieDetailsState {
  final NetworkExceptions networkExceptions;
  MovieDetailsError({
    required this.networkExceptions,
  });
}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsModel movieDetailsModel;
  MovieDetailsSuccess({
    required this.movieDetailsModel,
  });
}

class UserDetailsSuccess extends MovieDetailsState {
  final UserDetailsModel userDetails;

  UserDetailsSuccess({
    required this.userDetails,
  });
}

class MarkFavoriteLoading extends MovieDetailsState {}

class MarkFavoriteIdle extends MovieDetailsState {}

class MarkFavoriteSuccess extends MovieDetailsState {
  final FavoriteModel favoriteModel;

  MarkFavoriteSuccess({
    required this.favoriteModel,
  });
}

class MarkFavoriteError extends MovieDetailsState {
  final NetworkExceptions networkExceptions;
  MarkFavoriteError({
    required this.networkExceptions,
  });
}
