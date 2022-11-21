// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../shared/data/models/movies/movies_id/movies_video_by_id_model.dart';

@immutable
abstract class VideoForMovieState {}

class VideoForMovieStateIdle extends VideoForMovieState {}

class VideoForMovieStateLoading extends VideoForMovieState {}

class VideoForMovieStateSuccess extends VideoForMovieState {
  final MovieVideoById videoForMovieResultsList;

  VideoForMovieStateSuccess(this.videoForMovieResultsList);
}

class VideoForMovieStateError extends VideoForMovieState {
  final NetworkExceptions networkExceptions;
  VideoForMovieStateError(
    this.networkExceptions,
  );
}
