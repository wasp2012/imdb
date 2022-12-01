// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:imdb_demo/shared/constants/strings.dart';

import '../../shared/data/models/movies/results.dart';

class BluredMovieImageWidget extends StatefulWidget {
  final List<Results>? movie;
  const BluredMovieImageWidget({
    Key? key,
    this.movie,
  }) : super(key: key);

  @override
  State<BluredMovieImageWidget> createState() => _BluredMovieImageWidgetState();
}

class _BluredMovieImageWidgetState extends State<BluredMovieImageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    if (widget.movie!.isNotEmpty) {
      Future.delayed(const Duration(seconds: 1), () {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(seconds: widget.movie!.length * 20),
            curve: Curves.linear);
      });
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: SizedBox(
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
