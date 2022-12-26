import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../../shared/constants/strings.dart';
import '../../shared/data/models/account/favorite_model.dart';
import '../../shared/data/models/account/watchlist_model.dart';

import '../../shared/data/models/movies/results.dart';

class WatchLaterListWidget extends StatelessWidget {
  WatchLaterListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var favCubit = context.read<FavoriteCubit>();

    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(6),
            child: BlocConsumer<FavoriteCubit, FavoriteState>(
                listener: (context, state) {
              if (state is FavoriteStateSaved || state is WatchListStateSaved) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text('Saved '),
                  ),
                );
              } else if (state is FavoriteStateRemoved ||
                  state is WatchListStateRemoved) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text('Removed '),
                  ),
                );
              } else if (state is AlreadyFavorite ||
                  state is AlreadyInWatchList) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text('Something wrong happened try again!'),
                  ),
                );
              }
            }, builder: (context, state) {
              if (state is FavoriteStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: favCubit.watchListResultModel?.results?.length ?? 0,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (context) async {
                            await favCubit.emitAddToWatchList(WatchListBody(
                                mediaId: favCubit
                                    .watchListResultModel?.results![index].id,
                                mediaType: mediaTypeMovie,
                                watchList: false));
                            await favCubit.emitGetAllWatchList();
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (context) async {
                            await favCubit.emitMarkAsFavorite(
                              FavoriteBody(
                                  mediaId: favCubit
                                      .watchListResultModel?.results![index].id,
                                  mediaType: mediaTypeMovie,
                                  favorite: true),
                            );
                          },
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.white,
                          icon: Icons.favorite,
                          label: 'Favorite',
                        ),
                      ],
                    ),
                    child: buildItem(
                        favCubit.watchListResultModel?.results?[index],
                        context),
                  );
                },
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget buildItem(Results? result, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, movieDetailsScreen,
            arguments: result.id.toString()),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage('$imageDisplay${result?.posterPath}'),
          ),
          title: Text(
            result!.originalTitle!,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          trailing: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
