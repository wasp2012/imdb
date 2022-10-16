// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:imdb_demo/injection.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/movies/movie_details.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';
import 'package:intl/intl.dart';
import 'package:neon/neon.dart';

import '../../business_logic/movie_detail_cubit/movie_details_cubit.dart';
import '../../business_logic/movie_detail_cubit/movie_details_state.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String movieId;

  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);

  Widget characterInfo(String title, String value, BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
          ),
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent, BuildContext context) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Theme.of(context).primaryColor,
      thickness: 2,
    );
  }

  Widget displayRandomQuoteOrEmptySpace(String tagLine) {
    if (tagLine.isNotEmpty) {
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 180, 37, 27),
            shadows: const [
              Shadow(
                blurRadius: 7,
                color: Colors.deepPurpleAccent,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
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
    print('MoviesDetails is :$movieId');
    // var cubit = BlocProvider.of<MovieDetailsCubit>(context);

    // cubit.emitMovieDetails(widget.movieId);
    // print(cubit.state);
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            getIt<MovieDetailsCubit>()..emitMovieDetails(movieId),
        child: BlocConsumer<MovieDetailsCubit,
            MovieDetailsState<MovieDetailsModel>>(
          listener: (context, state) {},
          builder: (context, MovieDetailsState<MovieDetailsModel> state) {
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
              success: (MovieDetailsModel movieDetailsModel) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 600,
                      pinned: true,
                      stretch: true,
                      backgroundColor: Theme.of(context).backgroundColor,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        collapseMode: CollapseMode.parallax,
                        title: Container(
                          child: Neon(
                            text: '${movieDetailsModel.originalTitle!}',
                            color: Colors.cyan,
                            fontSize: 20,
                            flickeringText: true,
                            font: NeonFont.Membra,
                          ),
                        ),
                        background: Image.network(
                          '$imageDisplay${movieDetailsModel.posterPath}',
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                characterInfo('Title : ',
                                    movieDetailsModel.originalTitle!, context),
                                buildDivider(315, context),
                                // characterInfo('Budget: ',
                                //     '${movieDetailsModel.budget}\$ '),
                                characterInfo(
                                    'Budget: ',
                                    movieDetailsModel.budget
                                                .toString()
                                                .isNotEmpty &&
                                            movieDetailsModel.budget != 0
                                        ? '${NumberFormat("#,###", "en_US").format(movieDetailsModel.budget)}\$ '
                                        : 'Budget Not Supported!',
                                    context),
                                buildDivider(250, context),
                                characterInfo('Release date : ',
                                    movieDetailsModel.releaseDate!, context),
                                buildDivider(
                                    movieDetailsModel.releaseDate!.length *
                                        30.0,
                                    context),
                                characterInfo(
                                    'Adult : ',
                                    movieDetailsModel.adult == true
                                        ? '+18'
                                        : 'Family',
                                    context),
                                buildDivider(300, context),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                      )),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      characterInfo(
                                          'Rate: ',
                                          '${movieDetailsModel.voteAverage.toString()} /10',
                                          context),
                                      characterInfo(
                                          'Vote Count: ',
                                          movieDetailsModel.voteCount
                                              .toString(),
                                          context)
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                characterInfo(
                                    'Popularity: ',
                                    '${(movieDetailsModel.popularity!.floor() / 100.0).toString()} %',
                                    context),
                                buildDivider(300, context),
                                RichText(
                                  text: TextSpan(
                                    text: 'Overview :',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                  ),
                                ),
                                buildDivider(300, context),
                                Text(
                                  ' ${movieDetailsModel.overview!}',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 16, height: 1.1),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 50,
                                  child: displayRandomQuoteOrEmptySpace(
                                      movieDetailsModel.tagline!),
                                ),
                                const SizedBox(
                                  height: 200,
                                ),
                                ElevatedButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, videoScreen,
                                        arguments: movieId),
                                    child: Text('Trailers')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: Icon(Icons.favorite_border_outlined)),
    );
  }
}
