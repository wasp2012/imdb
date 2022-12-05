import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../../../shared/data/models/account/favorite_model.dart';

import '../../../shared/constants/strings.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    Key? key,
    required this.favCubit,
    required this.movieId,
  }) : super(key: key);

  final FavoriteCubit favCubit;
  final String? movieId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is FavoriteStateSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Saved to Favorite'),
            ),
          );
        } else if (state is FavoriteStateRemoved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Removed From Favorite'),
            ),
          );
        } else if (state is AlreadyFavorite) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Something wrong happened try again!'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FavoriteStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return FloatingActionButton(
          onPressed: () async {
            if (favCubit.isExist!) {
              favCubit.emitMarkAsFavorite(FavoriteBody(
                  mediaType: mediaTypeMovie,
                  mediaId: int.parse(movieId!),
                  favorite: false));
            } else {
              favCubit.emitMarkAsFavorite(
                FavoriteBody(
                    mediaType: mediaTypeMovie,
                    mediaId: int.parse(movieId!),
                    favorite: true),
              );
            }
          },
          child: Icon(
            favCubit.iconData,
            color: Colors.amber[900],
          ),
        );
      },
    );
  }
}
