import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb_demo/shared/constants/strings.dart';

import '../../business_logic/movies_cubitt/movies_cubit/movies_cubit.dart';
import '../widget/blured_movie_image_widget.dart';
import '../widget/movie_section_widget.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final MoviesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Stack(
            children: [
              BluredMovieImageWidget(movie: cubit.allCategories),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, moviesListScreen,
                      arguments: cubit),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        const SearchForm(),
                        SizedBox(
                          height: 20.h,
                        ),
                        MovieSectionWidget(
                          sectionTitle: 'Now Playing',
                          moviesList: cubit.nowPlayingMoviesList,
                          adaptiveHeight: 350,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        cubit.topRatedMoviesList!.isNotEmpty && cubit.topRatedMoviesList != null
            ? MovieSectionWidget(
                sectionTitle: 'Top Rated',
                moviesList: cubit.topRatedMoviesList,
                adaptiveHeight: 150)
            : const CircularProgressIndicator(),
        cubit.popularMoviesList!.isNotEmpty && cubit.popularMoviesList != null
            ? MovieSectionWidget(
                sectionTitle: 'Popular',
                moviesList: cubit.popularMoviesList,
                adaptiveHeight: 150)
            : const CircularProgressIndicator(),
        cubit.upComingMoviesList!.isNotEmpty && cubit.upComingMoviesList != null
            ? MovieSectionWidget(
                sectionTitle: 'Upcoming',
                moviesList: cubit.upComingMoviesList,
                adaptiveHeight: 150)
            : const CircularProgressIndicator(),
      ],
    );
  }
}

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: 400,
      height: 50,
      child: TextFormField(
        enabled: false,
        cursorColor: Colors.white,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(115, 158, 158, 158),
          hintText: 'Search',
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus || !currentFocus.isFirstFocus) {
            currentFocus.unfocus();
          }
        },
      ),
    );
  }
}
