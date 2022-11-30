// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
import 'package:flutter/material.dart';
import 'package:imdb_demo/shared/data/models/movies/movies_id/movies_video_by_id_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerWidget extends StatefulWidget {
  final List<VideoForMovieResult?> results;
  const YouTubePlayerWidget({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  State<YouTubePlayerWidget> createState() => _YouTubePlayerWidgetState();
}

class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget> {
  late PlayerState? _playerState;
  late YoutubeMetaData? _videoMetaData;

  final bool _isPlayerReady = false;
  late YoutubePlayerController? _controller;

  void listener() {
    if (_isPlayerReady && mounted && !_controller!.value.isFullScreen) {
      setState(() {
        _playerState = _controller?.value.playerState;
        _videoMetaData = _controller?.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller?.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
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
            _controller = YoutubePlayerController(
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
                controller: _controller!,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                onReady: () {
                  _controller?.addListener(listener);
                },
              ),
            );
          });
    }
  }
}
