// ignore_for_file: public_member_api_docs, sort_constructors_first, sort_child_properties_last, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/movies/results.dart';

class MoviesGridWidget extends StatelessWidget {
  Results movie;

  MoviesGridWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('${movie.id} ${movie.backdropPath}');
    return Container(
      padding: EdgeInsetsDirectional.all(5),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, movieDetailsScreen,
            arguments: movie.id.toString()),
        child: Stack(
          children: [
            GridTile(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.transparent,
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 30,
                  child: movie.posterPath!.isNotEmpty
                      ? Image.network(
                          '$imageDisplay${movie.posterPath}',
                          fit: BoxFit.fill,
                        )
                      : Image.asset('assets/images/placeholder.gif'),
                ),
              ),
            ),
            Stack(
              children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  value: (movie.voteAverage! / 10),
                  strokeWidth: 5,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                Positioned.fill(
                    child: Center(
                  child: Text(
                    '${movie.voteAverage}%',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        backgroundColor: Colors.white54),
                  ),
                )),
              ],
            ),
          ],
        ),
        // Text(
        //   '${movie.title}',
        //   style: TextStyle(
        //     height: 1.3,
        //     fontSize: 16,
        //     color: Colors.white,
        //     fontWeight: FontWeight.bold,
        //   ),
        //   overflow: TextOverflow.ellipsis,
        //   maxLines: 2,
        //   textAlign: TextAlign.center,
        // ),
      ),
    );
  }
}
