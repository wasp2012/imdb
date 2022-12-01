import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:neon/neon.dart';
import '../../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../../../business_logic/movies_cubitt/movie_detail_cubit/movie_details_cubit.dart';
import '../../../business_logic/movies_cubitt/movie_detail_cubit/movie_details_state.dart';
import '../../../injection.dart';
import '../../../shared/common/gradient.dart';
import '../../../shared/constants/strings.dart';
import '../../widget/movie_details/character_info_widget.dart';
import '../../widget/movie_details/floating_action_button_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String? movieId;

  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late final cubit;
  @override
  void initState() {
    super.initState();
    cubit = getIt<FavoriteCubit>();
    cubit.checkIfMovieExist(int.parse(widget.movieId!));
  }

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
    var movieCubit = BlocProvider.of<MovieDetailsCubit>(context);
    var favCubit = getIt<FavoriteCubit>();

    return Scaffold(
      body: FutureBuilder(
          future: Future.wait([
            getIt.allReady(),
            movieCubit.emitMovieDetails(widget.movieId!),
          ]),
          builder: (context, snapshot) =>
              BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                  builder: (context, state) {
                if (state is MovieDetailsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: SharedGradient.gradientColors(context),
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: CustomScrollView(
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
                                  text:
                                      '${movieCubit.movieDetailsModel!.title}',
                                  color: Colors.cyan,
                                  fontSize: 20,
                                  flickeringText: true,
                                  font: NeonFont.Membra,
                                ),
                              ),
                              background: movieCubit.movieDetailsModel!
                                          .posterPath!.isNotEmpty &&
                                      movieCubit
                                              .movieDetailsModel!.posterPath !=
                                          null
                                  ? Image.network(
                                      '$imageDisplay${movieCubit.movieDetailsModel!.posterPath}',
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
                                margin:
                                    const EdgeInsets.fromLTRB(14, 14, 14, 0),
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CharacterInfoWIdget(
                                      title: 'Title : ',
                                      value: movieCubit
                                          .movieDetailsModel!.originalTitle!,
                                    ),
                                    CharacterInfoWIdget(
                                      title: 'Budget: ',
                                      value: movieCubit
                                                  .movieDetailsModel!.budget
                                                  .toString()
                                                  .isNotEmpty &&
                                              movieCubit.movieDetailsModel!
                                                      .budget !=
                                                  0
                                          ? '${NumberFormat("#,###", "en_US").format(movieCubit.movieDetailsModel!.budget)} \$'
                                          : 'Budget Not Supported!',
                                    ),
                                    CharacterInfoWIdget(
                                      title: 'Release date : ',
                                      value: movieCubit
                                          .movieDetailsModel!.releaseDate!,
                                    ),
                                    CharacterInfoWIdget(
                                      title: 'Adult : ',
                                      value:
                                          movieCubit.movieDetailsModel!.adult ==
                                                  true
                                              ? '+18'
                                              : 'Family',
                                    ),
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
                                          CharacterInfoWIdget(
                                            title: 'Rate: ',
                                            value:
                                                '${movieCubit.movieDetailsModel!.voteAverage.toString()} /10',
                                          ),
                                          CharacterInfoWIdget(
                                            title: 'Vote Count: ',
                                            value: movieCubit
                                                .movieDetailsModel!.voteCount
                                                .toString(),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                      ),
                                    ),
                                    Text(
                                        ' ${movieCubit.movieDetailsModel!.overview!}',
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: displayRandomQuoteOrEmptySpace(
                                          movieCubit
                                              .movieDetailsModel!.tagline!),
                                    ),
                                    const SizedBox(
                                      height: 200,
                                    ),
                                    ElevatedButton(
                                        onPressed: () => Navigator.pushNamed(
                                            context, videoScreen,
                                            arguments: widget.movieId),
                                        child: const Text('Trailers')),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              })),
      floatingActionButton: FloatingActionButtonWidget(
          favCubit: favCubit, movieId: widget.movieId),
    );
  }
}
