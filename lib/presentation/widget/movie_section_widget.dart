import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/injection.dart';

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
      final cubit = getIt<MoviesCubit>();

      cubit.emitNowPlayingMovies();
      return BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, MoviesState state) {
          return state.when(idle: () {
            return Image.asset('assets/images/placeholder.gif');
          }, loading: () {
            return Image.asset('assets/images/placeholder.gif');
          }, success: (nowPlayingMovieModel) {
            return SingleChildScrollView(
              child: Column(
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
                        mainAxisSpacing: 1,
                      ),
                      itemCount: cubit.nowPlayingMoviesList!.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MoviesGridWidget(
                          movie: cubit.nowPlayingMoviesList![index],
                        );
                      },
                    ),
                  ),
                  Divider(color: Theme.of(context).primaryColor),
                ],
              ),
            );
          }, error: (NetworkExceptions error) {
            return Center(
                child: Text(NetworkExceptions.getErrorMessage(error)));
          });
        },
      );
    } else if (widget.flag == 2) {
      final cubit = getIt<MoviesCubit>();

      cubit.emitTopRatedMovies();

      return Container(
        // margin: const EdgeInsets.only(top: 5, bottom: 15),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, MoviesState state) {
            return state.when(idle: () {
              return Image.asset('assets/images/placeholder.gif');
            }, loading: () {
              return Image.asset('assets/images/placeholder.gif');
            }, success: (topRatedMovieModel) {
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
                      itemCount: cubit.topRatedMoviesList!.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MoviesGridWidget(
                          movie: cubit.topRatedMoviesList![index],
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
      final cubit = getIt<MoviesCubit>();

      cubit.emitMoviesPopular();

      return Container(
        // margin: const EdgeInsets.only(top: 5, bottom: 15),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, MoviesState state) {
            return state.when(idle: () {
              return Image.asset('assets/images/placeholder.gif');
            }, loading: () {
              return Image.asset('assets/images/placeholder.gif');
            }, success: (popularMovieModel) {
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
                      itemCount: cubit.popularMoviesList!.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MoviesGridWidget(
                          movie: cubit.popularMoviesList![index],
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
      final cubit = getIt<MoviesCubit>();

      cubit.emitMoviesUpComing();

      return Container(
        // margin: const EdgeInsets.only(top: 5, bottom: 15),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, MoviesState state) {
            return state.when(idle: () {
              return Image.asset('assets/images/placeholder.gif');
            }, loading: () {
              return Image.asset('assets/images/placeholder.gif');
            }, success: (upcomingMovieModel) {
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
                      itemCount: cubit.upComingMoviesList!.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MoviesGridWidget(
                          movie: cubit.upComingMoviesList![index],
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
