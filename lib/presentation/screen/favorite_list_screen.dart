import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/movies_list_widget.dart';

import '../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../../injection.dart';
import 'package:imdb_demo/core/gradient.dart';
import '../widget/curved_bottom_navbar_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = getIt<FavoriteCubit>();
    return FutureBuilder(
        future: Future.wait([
          getIt.allReady(),
          cubit.emitGetFavoriteMovies(),
        ]),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: const CurvedBottomNavbarWidget(currentPage: 1),
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: SharedGradient.gradientColors(context),
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteMoviesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FavoriteMoviesError) {
                    return const Center(
                      child: Text('Error Occured'),
                    );
                  } else {
                    return cubit.allFavoriteModel!.results != null &&
                            cubit.allFavoriteModel!.results!.isNotEmpty
                        ? MoviesListWidget(
                            totalResults: cubit.allFavoriteModel!.results,
                          )
                        : Container();
                  }
                },
              ),
            ),
          );
        });
  }
}
