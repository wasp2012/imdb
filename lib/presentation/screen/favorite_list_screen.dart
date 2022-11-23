import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/presentation/widget/curved_bottom_navbar_widget.dart';
import 'package:imdb_demo/shared/common/gradient.dart';

import '../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../../injection.dart';
import '../../shared/constants/strings.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = getIt<FavoriteCubit>();
    return FutureBuilder(
        future: getIt.allReady(),
        builder: (context, AsyncSnapshot) {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: const CurvedBottomNavbarWidget(currentPage: 1),
            body: Container(
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
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        childAspectRatio: 1,
                      ),
                      itemCount: cubit.allFavoriteModel.totalResults,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, movieDetailsScreen,
                              arguments: cubit
                                  .allFavoriteModel.results![index].id
                                  .toString()),
                          child: Card(
                            color: Colors.transparent,
                            borderOnForeground: true,
                            elevation: 20,
                            child: Image.network(
                              '$imageDisplay${cubit.allFavoriteModel.results?[index].posterPath}',
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          );
        });
  }
}
