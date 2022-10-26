// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:imdb_demo/injection.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/account/favorite_model.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';
import 'package:intl/intl.dart';
import 'package:neon/neon.dart';

import '../../business_logic/movie_detail_cubit/movie_details_cubit.dart';
import '../../business_logic/movie_detail_cubit/movie_details_state.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String movieId;

  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
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
  void initState() {
    super.initState();
    BlocProvider.of<MovieDetailsCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MovieDetailsCubit>(context);

    return Scaffold(
        body: FutureBuilder(
            future: cubit.emitMovieDetails(widget.movieId),
            builder: (context, snapshot) =>
                BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                    builder: (context, state) {
                  if (state is MovieDetailsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else {
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
                                  text: '${cubit.movieDetailsModel!.title}',
                                  color: Colors.cyan,
                                  fontSize: 20,
                                  flickeringText: true,
                                  font: NeonFont.Membra,
                                ),
                              ),
                              background: cubit.movieDetailsModel!.posterPath!
                                          .isNotEmpty &&
                                      cubit.movieDetailsModel!.posterPath !=
                                          null
                                  ? Image.network(
                                      '$imageDisplay${cubit.movieDetailsModel!.posterPath}',
                                      fit: BoxFit.fill,
                                      filterQuality: FilterQuality.high,
                                    )
                                  : Image.asset(
                                      'assets/images/placeholder.gif')),
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
                                    characterInfo(
                                        'Title : ',
                                        cubit.movieDetailsModel!.originalTitle!,
                                        context),
                                    buildDivider(315, context),
                                    // characterInfo('Budget: ',
                                    //     '${movieDetailsModel.budget}$ '),
                                    characterInfo(
                                        'Budget: ',
                                        cubit.movieDetailsModel!.budget
                                                    .toString()
                                                    .isNotEmpty &&
                                                cubit.movieDetailsModel!
                                                        .budget !=
                                                    0
                                            ? '${NumberFormat("#,###", "en_US").format(cubit.movieDetailsModel!.budget)} \$'
                                            : 'Budget Not Supported!',
                                        context),
                                    buildDivider(250, context),
                                    characterInfo(
                                        'Release date : ',
                                        cubit.movieDetailsModel!.releaseDate!,
                                        context),
                                    buildDivider(
                                        cubit.movieDetailsModel!.releaseDate!
                                                .length *
                                            30.0,
                                        context),
                                    characterInfo(
                                        'Adult : ',
                                        cubit.movieDetailsModel!.adult == true
                                            ? '+18'
                                            : 'Family',
                                        context),
                                    buildDivider(300, context),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          characterInfo(
                                              'Rate: ',
                                              '${cubit.movieDetailsModel!.voteAverage.toString()} /10',
                                              context),
                                          characterInfo(
                                              'Vote Count: ',
                                              cubit.movieDetailsModel!.voteCount
                                                  .toString(),
                                              context)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    // characterInfo(
                                    //     'Popularity: ',
                                    //     '${(cubit.movieDetailsModel!.popularity!.floor() / 100.0).toString()} %',
                                    //     context),
                                    // buildDivider(300, context),
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
                                      ' ${cubit.movieDetailsModel!.overview!}',
                                      textAlign: TextAlign.start,
                                      style:
                                          TextStyle(fontSize: 16, height: 1.1),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 50,
                                      child: displayRandomQuoteOrEmptySpace(
                                          cubit.movieDetailsModel!.tagline!),
                                    ),
                                    const SizedBox(
                                      height: 200,
                                    ),
                                    ElevatedButton(
                                        onPressed: () => Navigator.pushNamed(
                                            context, videoScreen,
                                            arguments: widget.movieId),
                                        child: Text('Trailers')),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                })),
        floatingActionButton:
            BlocListener<MovieDetailsCubit, MovieDetailsState>(
          listener: (context, state) {
            if (state is MarkFavoriteLoading || state is MarkFavoriteIdle) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          child: FloatingActionButton(
            onPressed: () {
              cubit.emitMarkAsFavorite(
                FavoriteBody(
                    mediaType: mediaTypeMovie,
                    mediaId: int.parse(widget.movieId),
                    favorite: cubit.isFavorite == true ? false : true),
              );
            },
            child: Icon(
              cubit.isFavorite == true ? Icons.favorite : Icons.favorite_border,
            ),
          ),
        ));
  }
}
