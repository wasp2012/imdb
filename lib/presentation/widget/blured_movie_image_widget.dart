// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/movies/now_playing.dart';

import '../../business_logic/movies_cubit/movies_cubit.dart';
import '../../business_logic/movies_cubit/movies_state.dart';
import '../../injection.dart';
import '../../shared/data/models/movies/results.dart';

class BluredMovieImageWidget extends StatefulWidget {
  List<Results>? movie;
  BluredMovieImageWidget({
    Key? key,
    this.movie,
  }) : super(key: key);

  @override
  State<BluredMovieImageWidget> createState() => _BluredMovieImageWidgetState();
}

class _BluredMovieImageWidgetState extends State<BluredMovieImageWidget> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    if (widget.movie!.isNotEmpty) {
      Future.delayed(const Duration(seconds: 1), () {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(seconds: widget.movie!.length * 20),
            curve: Curves.linear);
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.count(
        controller: _scrollController,
        crossAxisCount: 1,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: widget.movie!.map(
          (movie) {
            return ClipPath(
              clipper: ClippingClass(),
              child: widget.movie!.isNotEmpty
                  ? Image.network(
                      '$imageDisplay${movie.posterPath}',
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/placeholder.gif'),
            );
          },
        ).toList(),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 40);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height - 40,
        size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
