import 'package:flutter/material.dart';
import '../../shared/constants/strings.dart';
import '../../shared/data/models/movies/results.dart';

class MoviesGridWidget extends StatelessWidget {
  final Results movie;

  const MoviesGridWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(5),
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
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          backgroundColor: Colors.white54),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
