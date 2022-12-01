import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/common/gradient.dart';
import '../widget/blured_movie_image_widget.dart';

import '../../business_logic/movies_cubit/movies_cubit.dart';
import '../../injection.dart';
import '../widget/curved_bottom_navbar_widget.dart';
import '../widget/movie_section_widget.dart';

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
    return FutureBuilder(
        future: getIt.allReady(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var cubit = getIt<MoviesCubit>();
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              extendBody: true,
              bottomNavigationBar:
                  const CurvedBottomNavbarWidget(currentPage: 0),
              key: globalKey,
              // drawer: const NavigationDrawerWidget(),
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
                                  movie: cubit.allCategories),
                            BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 400,
                                      height: 50,
                                      child: TextFormField(
                                        cursorColor: Colors.white,
                                        textAlign: TextAlign.start,
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        decoration: InputDecoration(
                                          filled: true, //<-- SEE HERE
                                          fillColor: const Color.fromARGB(
                                              115, 158, 158, 158),
                                          hintText: 'Search',
                                          hoverColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          suffixIcon: const Icon(
                                            Icons.search,
                                            color: Colors.white,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white)),
                                        ),
                                        onTap: () {
                                          FocusScopeNode currentFocus =
                                              FocusScope.of(context);
                                          if (!currentFocus.hasPrimaryFocus ||
                                              !currentFocus.isFirstFocus) {
                                            currentFocus.unfocus();
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
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
                          MovieSectionWidget(
                              sectionTitle: 'Top Rated', flag: 2),
                          MovieSectionWidget(sectionTitle: 'Popular', flag: 3),
                          MovieSectionWidget(sectionTitle: 'Upcoming', flag: 4),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
