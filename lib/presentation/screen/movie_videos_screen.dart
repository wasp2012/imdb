import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/business_logic/video_for_movie_cubit/video_for_movie_cubit.dart';
import 'package:imdb_demo/business_logic/video_for_movie_cubit/video_for_movie_state.dart';
import 'package:imdb_demo/injection.dart';
import 'package:imdb_demo/presentation/widget/youtube_player_widget.dart';
import 'package:imdb_demo/shared/data/models/movies/movies_id/movies_video_by_id_model.dart';

import '../../shared/web_services/errors/network_exceptions.dart';

class MovieVideosScreen extends StatelessWidget {
  final String movieId;
  const MovieVideosScreen({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    print(movieId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text('YouTube'),
      ),
      body: BlocProvider(
        create: (context) =>
            getIt<VideoForMovieCubit>()..getMovieVideos(movieId),
        child:
            BlocBuilder<VideoForMovieCubit, VideoForMovieState<MovieVideoById>>(
          builder: (context, state) {
            return state.when(
              idle: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              success: (MovieVideoById movieVideoById) {
                return YouTubePlayerWidget(
                  results: movieVideoById.results!,
                );
              },
              error: (NetworkExceptions error) {
                return Center(
                  child: Text(
                    NetworkExceptions.getErrorMessage(error),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
