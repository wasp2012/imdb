import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/video_for_movie_cubit/video_for_movie_cubit.dart';
import '../../business_logic/video_for_movie_cubit/video_for_movie_state.dart';
import '../../injection.dart';
import '../widget/youtube_player_widget.dart';

class MovieVideosScreen extends StatelessWidget {
  final String? movieId;
  const MovieVideosScreen({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    final cubit = getIt<VideoForMovieCubit>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          title: const Text('YouTube'),
        ),
        body: FutureBuilder(
          future: cubit.getMovieVideos(movieId!),
          builder: (context, snapshot) =>
              BlocBuilder<VideoForMovieCubit, VideoForMovieState>(
            builder: (context, state) {
              if (state is VideoForMovieStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is VideoForMovieStateError) {
                return const Center(
                  child: Text('Something wrong happened'),
                );
              } else {
                if (cubit.videoForMovieResultsList!.isNotEmpty) {
                  return YouTubePlayerWidget(
                      results: cubit.videoForMovieResultsList!);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
            },
          ),
        ));
  }
}
