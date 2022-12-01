// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
import 'package:flutter/material.dart';
import 'package:imdb_demo/injection.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:imdb_demo/shared/data/models/movies/movies_id/movies_video_by_id_model.dart';

import '../../business_logic/video_for_movie_cubit/video_for_movie_cubit.dart';

class YouTubePlayerWidget extends StatefulWidget {
  final List<VideoForMovieResult?> results;

  YouTubePlayerWidget({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  State<YouTubePlayerWidget> createState() => _YouTubePlayerWidgetState();
}

class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget> {
  VideoForMovieCubit? cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<VideoForMovieCubit>();
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    cubit?.controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    cubit?.controller.dispose();
    super.dispose();
  }

  void listener() {
    if (cubit!.isPlayerReady &&
        mounted &&
        !cubit!.controller.value.isFullScreen) {
      cubit?.listener();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.results.isEmpty) {
      return const Center(
        child: Text('Nothing to show'),
      );
    } else {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2,
          ),
          itemCount: widget.results.length,
          itemBuilder: (BuildContext context, int index) {
            cubit?.controller = YoutubePlayerController(
              initialVideoId: widget.results[index]!.key!,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: true,
              ),
            );
            return Container(
              color: Theme.of(context).backgroundColor,
              margin: const EdgeInsets.all(10),
              child: YoutubePlayer(
                controller: cubit!.controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                onReady: () {
                  cubit?.controller.addListener(listener);
                },
              ),
            );
          });
    }
  }
}
