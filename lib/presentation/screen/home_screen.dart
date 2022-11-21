import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/blured_movie_image_widget.dart';
import '../../shared/constants/strings.dart';

import '../../business_logic/movies_cubit/movies_cubit.dart';
import '../../injection.dart';
import '../widget/curved_bottom_navbar_widget.dart';
import '../widget/movie_section_widget.dart';
import '../widget/nav_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var cubit = getIt<MoviesCubit>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        extendBody: true,
        bottomNavigationBar: CurvedBottomNavbarWidget(currentPage: 0),
        key: globalKey,
        // drawer: const NavigationDrawerWidget(),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Stack(
                    children: [
                      if (cubit.nowPlayingMoviesList != null &&
                          cubit.nowPlayingMoviesList!.isNotEmpty)
                        BluredMovieImageWidget(
                            movie: cubit.nowPlayingMoviesList),
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10.0,
                          sigmaY: 10.0,
                        ),
                        child: Container(
                          color: Colors.black.withOpacity(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                cursorColor: Colors.white,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  suffixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    gapPadding: 5,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              const MovieSectionWidget(
                                  sectionTitle: 'Now Playing', flag: 1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: const [
                    MovieSectionWidget(sectionTitle: 'Top Rated', flag: 2),
                    MovieSectionWidget(sectionTitle: 'Popular', flag: 3),
                    MovieSectionWidget(sectionTitle: 'Upcoming', flag: 4),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
