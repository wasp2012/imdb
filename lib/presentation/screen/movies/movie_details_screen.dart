import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/movie_details/sliver_appbar_widget.dart';
import '../../widget/movie_details/sliver_list_movie_details_widget.dart';
import '../../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../../../business_logic/movies_cubitt/movie_detail_cubit/movie_details_cubit.dart';
import '../../../business_logic/movies_cubitt/movie_detail_cubit/movie_details_state.dart';
import '../../../injection.dart';
import '../../../shared/common/gradient.dart';
import '../../widget/movie_details/floating_action_button_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String? movieId;

  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late FavoriteCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = getIt<FavoriteCubit>();
    cubit.checkIfMovieExist(int.parse(widget.movieId!));
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
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
              builder: (context, state) {
                if (state is MovieDetailsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
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
                        SliverAppBarWidget(movieCubit: movieCubit),
                        SliverListMovieDetailsWidget(
                          movieId: widget.movieId,
                        )
                      ],
                    ),
                  );
                }
              },
            );
          }),
      floatingActionButton: FloatingActionButtonWidget(
        favCubit: favCubit,
        movieId: widget.movieId,
      ),
    );
  }
}
