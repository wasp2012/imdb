import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb_demo/injection.dart';

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
        if (state is MoviesStateLoading) {
          return const CircularProgressIndicator();
        } else if (state is MoviesStateError) {
          return Card(
            elevation: 20,
            child: Text(state.networkExceptions.toString()),
          );
        }
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
              height: 350.h,
              child: cubit.nowPlayingMoviesList!.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 1,
                        crossAxisCount: 1,
                        childAspectRatio: 1.4,
                        mainAxisSpacing: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.nowPlayingMoviesList!.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MoviesGridWidget(
                          movie: cubit.nowPlayingMoviesList![index],
                        );
                      },
                    )
                  : Container(),
            ),
            // Divider(color: Theme.of(context).primaryColor),
          ],
        );
      });
    } else if (widget.flag == 2) {
      final cubit = getIt<MoviesCubit>();

      cubit.emitTopRatedMovies();

      return BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, MoviesState state) {
          if (state is MoviesStateLoading) {
            return const CircularProgressIndicator();
          } else if (state is MoviesStateError) {
            return Card(
              elevation: 20,
              child: Text(state.networkExceptions.toString()),
            );
          } else {
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
                  child: cubit.topRatedMoviesList!.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.topRatedMoviesList!.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MoviesGridWidget(
                              movie: cubit.topRatedMoviesList![index],
                            );
                          },
                        )
                      : Container(),
                ),
                Divider(color: Theme.of(context).primaryColor),
              ],
            );
          }
        },
      );
    } else if (widget.flag == 3) {
      final cubit = getIt<MoviesCubit>();

      cubit.emitMoviesPopular();

      return BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, MoviesState state) {
          if (state is MoviesStateLoading) {
            return const CircularProgressIndicator();
          } else if (state is MoviesStateError) {
            return Card(
              elevation: 20,
              child: Text(state.networkExceptions.toString()),
            );
          } else {
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
                  child: cubit.popularMoviesList!.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.popularMoviesList!.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MoviesGridWidget(
                              movie: cubit.popularMoviesList![index],
                            );
                          },
                        )
                      : Container(),
                ),
                Divider(color: Theme.of(context).primaryColor),
              ],
            );
          }
        },
      );
    } else if (widget.flag == 4) {
      final cubit = getIt<MoviesCubit>();

      cubit.emitMoviesUpComing();

      return BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, MoviesState state) {
          if (state is MoviesStateLoading) {
            return const CircularProgressIndicator();
          } else if (state is MoviesStateError) {
            return Card(
              elevation: 20,
              child: Text(state.networkExceptions.toString()),
            );
          } else {
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
                  child: cubit.upComingMoviesList!.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.upComingMoviesList!.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MoviesGridWidget(
                              movie: cubit.upComingMoviesList![index],
                            );
                          },
                        )
                      : Container(),
                ),
                Divider(
                  color: Theme.of(context).primaryColor,
                ),
              ],
            );
          }
        },
      );
    } else {
      return Container();
    }
  }
}
