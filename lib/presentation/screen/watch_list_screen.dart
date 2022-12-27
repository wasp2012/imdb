import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../widget/movies_list_widget.dart';
import '../widget/watch_later_list_widget.dart';

import 'package:imdb_demo/core/gradient.dart';
import '../widget/curved_bottom_navbar_widget.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favCubit = context.read<FavoriteCubit>();
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const CurvedBottomNavbarWidget(currentPage: 2),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: SharedGradient.gradientColors(context),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder(
            future: favCubit.emitGetAllWatchList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return WatchLaterListWidget(
              );
            }),
      ),
    );
  }
}
