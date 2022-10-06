import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/shared/data/models/movies/now_playing.dart';
import 'package:imdb_demo/shared/data/models/movies/popular.dart';
import 'package:imdb_demo/shared/data/models/movies/top_rated.dart';
import 'package:imdb_demo/shared/data/models/movies/upcoming.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../business_logic/movies_cubit/movies_cubit.dart';
import '../../business_logic/movies_cubit/movies_state.dart';

import 'movies_grid.dart';

class MovieSectionWidget extends StatefulWidget {
  final String sectionTitle;
  final int flag;

  const MovieSectionWidget({
    super.key,
    required this.sectionTitle,
    required this.flag,
  });

  @override
  State<MovieSectionWidget> createState() => _MovieSectionWidgetState();
}

class _MovieSectionWidgetState extends State<MovieSectionWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.flag == 1) {
      BlocProvider.of<NowPLayingMoviesCubit>(context).emitNowPlayingMovies();
      return BlocConsumer<NowPLayingMoviesCubit,
          MoviesState<NowPlayingMovieModel>>(
        listener: (context, state) {},
        builder: (context, MoviesState<NowPlayingMovieModel> state) {
          return state.when(idle: () {
            return const Center(child: CircularProgressIndicator());
          }, loading: () {
            return Image.asset('assets/images/placeholder.gif');
          }, success: (NowPlayingMovieModel nowPlayingMovieModel) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.sectionTitle}! ",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                    ),
                    itemCount: nowPlayingMovieModel.results!.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MoviesGridWidget(
                        movie: nowPlayingMovieModel.results![index],
                      );
                    },
                  ),
                ),
                Divider(color: Theme.of(context).primaryColor),
              ],
            );
          }, error: (NetworkExceptions error) {
            return Center(
                child: Text(NetworkExceptions.getErrorMessage(error)));
          });
        },
      );
    } else if (widget.flag == 2) {
      BlocProvider.of<TopRatedMoviesCubit>(context).emitTopRatedMovies();

      return Container(
        // margin: const EdgeInsets.only(top: 5, bottom: 15),
        child:
            BlocBuilder<TopRatedMoviesCubit, MoviesState<TopRatedMovieModel>>(
          builder: (context, MoviesState<TopRatedMovieModel> state) {
            return state.when(idle: () {
              return const Center(child: CircularProgressIndicator());
            }, loading: () {
              return const Center(child: CircularProgressIndicator());
            }, success: (TopRatedMovieModel topRatedMovieModel) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.sectionTitle}! ",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                  SizedBox(
                    height: 170,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: topRatedMovieModel.results!.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MoviesGridWidget(
                          movie: topRatedMovieModel.results![index],
                        );
                      },
                    ),
                  ),
                  Divider(color: Theme.of(context).primaryColor),
                ],
              );
            }, error: (NetworkExceptions error) {
              return Center(
                  child: Text(NetworkExceptions.getErrorMessage(error)));
            });
          },
        ),
      );
    } else if (widget.flag == 3) {
      BlocProvider.of<PopularMoviesCubit>(context).emitMoviesPopular();

      return Container(
        // margin: const EdgeInsets.only(top: 5, bottom: 15),
        child: BlocBuilder<PopularMoviesCubit, MoviesState<PopularMovieModel>>(
          builder: (context, MoviesState<PopularMovieModel> state) {
            return state.when(idle: () {
              return const Center(child: CircularProgressIndicator());
            }, loading: () {
              return const Center(child: CircularProgressIndicator());
            }, success: (PopularMovieModel popularMovieModel) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.sectionTitle}! ",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                  SizedBox(
                    height: 170,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: popularMovieModel.results!.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MoviesGridWidget(
                          movie: popularMovieModel.results![index],
                        );
                      },
                    ),
                  ),
                  Divider(color: Theme.of(context).primaryColor),
                ],
              );
            }, error: (NetworkExceptions error) {
              return Center(
                  child: Text(NetworkExceptions.getErrorMessage(error)));
            });
          },
        ),
      );
    } else if (widget.flag == 4) {
      BlocProvider.of<UpcomingMoviesCubit>(context).emitMoviesUpComing();

      return Container(
        // margin: const EdgeInsets.only(top: 5, bottom: 15),
        child:
            BlocBuilder<UpcomingMoviesCubit, MoviesState<UpcomingMovieModel>>(
          builder: (context, MoviesState<UpcomingMovieModel> state) {
            return state.when(idle: () {
              return const Center(child: CircularProgressIndicator());
            }, loading: () {
              return const Center(child: CircularProgressIndicator());
            }, success: (UpcomingMovieModel upcomingMovieModel) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.sectionTitle}! ",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                  SizedBox(
                    height: 170,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: upcomingMovieModel.results!.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MoviesGridWidget(
                          movie: upcomingMovieModel.results![index],
                        );
                      },
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              );
            }, error: (NetworkExceptions error) {
              return Center(
                  child: Text(NetworkExceptions.getErrorMessage(error)));
            });
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
