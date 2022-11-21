import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb_demo/presentation/widget/blured_movie_image_widget.dart';
import 'package:imdb_demo/shared/constants/strings.dart';

import '../../business_logic/movies_cubit/movies_cubit.dart';
import '../../injection.dart';
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
        key: globalKey,
        // drawer: const NavigationDrawerWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   margin: const EdgeInsets.only(top: 50),
              //   width: double.infinity,
              //   height: MediaQuery.of(context).size.height * 0.7,
              //   child: Stack(
              //     fit: StackFit.expand,
              //     children: [
              //       Image.asset(popcornImage),
              //       Positioned.fill(
              //         child: BackdropFilter(
              //           filter: ImageFilter.blur(
              //             sigmaX: 5.0,
              //             sigmaY: 5.0,
              //           ),
              //           child: Container(color: Colors.black.withOpacity(0)),
              //         ),
              //       ),
              //       TextField(
              //         cursorColor: Colors.white,
              //         textAlign: TextAlign.start,
              //         textAlignVertical: TextAlignVertical.bottom,
              //         decoration: InputDecoration(
              //           hintText: 'Search',
              //           suffixIcon: const Icon(Icons.search),
              //           border: OutlineInputBorder(
              //             gapPadding: 5,
              //             borderRadius: BorderRadius.circular(30),
              //           ),
              //         ),
              //       ),
              //       const MovieSectionWidget(
              //           sectionTitle: 'Now Playing', flag: 1),

              //     ],
              //   ),
              // ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Stack(
                  children: [
                    if (cubit.nowPlayingMoviesList != null &&
                        cubit.nowPlayingMoviesList!.isNotEmpty)
                      BluredMovieImageWidget(movie: cubit.nowPlayingMoviesList),
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
                            // IconButton(
                            //   padding: const EdgeInsets.all(10),
                            //   iconSize: 30,
                            //   color: Colors.white,
                            //   onPressed: () {
                            //     globalKey.currentState!.openDrawer();
                            //   },
                            //   icon: const Icon(Icons.menu),
                            // ),
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
                children: [
                  const MovieSectionWidget(sectionTitle: 'Top Rated', flag: 2),
                  const MovieSectionWidget(sectionTitle: 'Popular', flag: 3),
                  const MovieSectionWidget(sectionTitle: 'Upcoming', flag: 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
