import 'package:flutter/material.dart';

import '../../shared/constants/strings.dart';
import '../../shared/data/models/movies/results.dart';

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({
    super.key,
    required this.totalResults,
  });

  final List<Results>? totalResults;

  @override
  Widget build(BuildContext context) {
    print('MoviesListWidget');
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        childAspectRatio: 1,
      ),
      physics: const ClampingScrollPhysics(),
      itemCount: totalResults?.length,
      itemBuilder: (context, index) {
        return totalResults?[index].posterPath != null &&
                totalResults!.isNotEmpty
            ? GestureDetector(
                onTap: () => Navigator.pushNamed(context, movieDetailsScreen,
                    arguments: totalResults?[index].id.toString()),
                child: Container(
                  child: Card(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: totalResults != null &&
                            totalResults![index].posterPath!.isNotEmpty
                        ? Image.network(
                            '$imageDisplay${totalResults?[index].posterPath}',
                          )
                        : Image.asset(placeHolder),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
