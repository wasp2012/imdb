import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/business_logic/movies_cubitt/movies_cubit/movies_state.dart';
import 'package:imdb_demo/presentation/widget/movies_list_widget.dart';
import '../../business_logic/internet_cubit/internet_cubit.dart';
import 'check_internet_screen.dart';
import '../widget/home_screen_widget.dart';

import '../../business_logic/movies_cubitt/movies_cubit/movies_cubit.dart';
import '../../injection.dart';
import '../../shared/common/gradient.dart';
import '../widget/curved_bottom_navbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).allCategories?.clear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<MoviesCubit>();

    return FutureBuilder(
      future: Future.wait([
        getIt.allReady(),
        cubit.emitNowPlayingMovies(),
        cubit.emitTopRatedMovies(),
        cubit.emitMoviesPopular(),
        cubit.emitMoviesUpComing(),
      ]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var cubit = getIt<MoviesCubit>();
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          extendBody: true,
          bottomNavigationBar: const CurvedBottomNavbarWidget(
            currentPage: 0,
          ),
          key: globalKey,
          body: SingleChildScrollView(
            child: Container(
              height: 1250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: SharedGradient.gradientColors(context),
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesStateSuccess) {
                    return HomeScreenWidget(cubit: cubit);
                  } else if (state is MoviesStateError) {
                    return const Center(
                      child: Text('something went wrong'),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
