// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/data/models/movies/results.dart';
import '../../../shared/web_services/errors/network_exceptions.dart';

@immutable
abstract class MoviesState {}

class MoviesStateIdle extends MoviesState {}

class MoviesStateLoading extends MoviesState {}

class MoviesStateSuccess extends MoviesState {
  List<Results>? moviesList = [];

  MoviesStateSuccess(this.moviesList);
}

class MoviesStateError extends MoviesState {
  NetworkExceptions networkExceptions;
  MoviesStateError(
    this.networkExceptions,
  );
}
