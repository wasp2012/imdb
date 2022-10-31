import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/business_logic/movie_detail_cubit/movie_details_cubit.dart';
import 'package:imdb_demo/business_logic/profile_cubit/profile_cubit.dart';
import 'package:imdb_demo/business_logic/profile_cubit/profile_state.dart';
import 'package:imdb_demo/injection.dart';
import 'package:imdb_demo/presentation/screen/movie_details_screen.dart';

import '../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../../shared/constants/strings.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = getIt<FavoriteCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text('Favorite'),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteMoviesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoriteMoviesError) {
            return Center(
              child: Text('Error Occured'),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: cubit.allFavoriteModel.totalResults,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, movieDetailsScreen,
                        arguments: cubit.allFavoriteModel.results![index].id
                            .toString()),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        elevation: 20,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Image.network(
                          '$imageDisplay${cubit.allFavoriteModel.results![index].posterPath}',
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
