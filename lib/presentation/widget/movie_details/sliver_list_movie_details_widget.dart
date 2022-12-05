import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../business_logic/movies_cubitt/movie_detail_cubit/movie_details_cubit.dart';
import '../../../shared/constants/strings.dart';
import '../../widget/movie_details/character_info_widget.dart';

class SliverListMovieDetailsWidget extends StatelessWidget {
  final MovieDetailsCubit? movieCubit;
  final String? movieId;
  const SliverListMovieDetailsWidget(
      {super.key, required this.movieCubit, required this.movieId});
  Widget displayRandomQuoteOrEmptySpace(String tagLine) {
    if (tagLine.isNotEmpty) {
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 180, 37, 27),
            shadows: [
              Shadow(
                blurRadius: 7,
                color: Colors.deepPurpleAccent,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: false,
            animatedTexts: [
              FlickerAnimatedText(tagLine),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CharacterInfoWIdget(
                  title: 'Title : ',
                  value: movieCubit?.movieDetailsModel!.originalTitle!,
                ),
                SizedBox(
                  height: 7.h,
                ),
                CharacterInfoWIdget(
                  title: 'Budget: ',
                  value: movieCubit!.movieDetailsModel!.budget
                              .toString()
                              .isNotEmpty &&
                          movieCubit!.movieDetailsModel!.budget != 0
                      ? '${NumberFormat("#,###", "en_US").format(movieCubit!.movieDetailsModel!.budget)} \$'
                      : 'Budget Not Supported!',
                ),
                SizedBox(
                  height: 7.h,
                ),
                CharacterInfoWIdget(
                  title: 'Release date : ',
                  value: movieCubit!.movieDetailsModel!.releaseDate!,
                ),
                SizedBox(
                  height: 7.h,
                ),
                CharacterInfoWIdget(
                  title: 'Adult : ',
                  value: movieCubit!.movieDetailsModel!.adult == true
                      ? '+18'
                      : 'Family',
                ),
                SizedBox(
                  height: 7.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CharacterInfoWIdget(
                        title: 'Rate: ',
                        value:
                            '${movieCubit!.movieDetailsModel!.voteAverage.toString()} /10',
                      ),
                      CharacterInfoWIdget(
                        title: 'Vote Count: ',
                        value:
                            movieCubit!.movieDetailsModel!.voteCount.toString(),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Overview :',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                ),
                Text(' ${movieCubit!.movieDetailsModel!.overview!}',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1!),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: displayRandomQuoteOrEmptySpace(
                      movieCubit!.movieDetailsModel!.tagline!),
                ),
                const SizedBox(
                  height: 200,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).buttonColor,
                  ),
                  onPressed: () => Navigator.pushNamed(context, videoScreen,
                      arguments: movieId),
                  child: const Text('Trailers'),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
