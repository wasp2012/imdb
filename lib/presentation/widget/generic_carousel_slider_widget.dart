import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/data/models/movies/results.dart';
import '../../business_logic/movies_cubitt/movies_cubit/movies_cubit.dart';
import '../../business_logic/movies_cubitt/movies_cubit/movies_state.dart';
import '../../shared/constants/strings.dart';

class GenericCarouselSliderWidget extends StatefulWidget {
  const GenericCarouselSliderWidget({
    Key? key,
    required this.sectionTitle,
    required this.moviesList,
    required this.adaptiveHeight,
  }) : super(key: key);
  final List<Results>? moviesList;
  final String? sectionTitle;
  final double? adaptiveHeight;

  @override
  _GenericCarouselSliderWidgetState createState() =>
      _GenericCarouselSliderWidgetState();
}

class _GenericCarouselSliderWidgetState
    extends State<GenericCarouselSliderWidget> {
  @override
  void initState() {
    super.initState();
    resultsSlider = widget.moviesList!
        .map((item) => Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          imageDisplay + item.posterPath!,
                          fit: BoxFit.fill,
                          width: 1000.0,
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              '${widget.moviesList!.elementAt(widget.moviesList!.indexOf(item)).originalTitle}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }

  List<Widget>? resultsSlider;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(builder: (context, state) {
      if (state is MoviesStateLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is MoviesStateError) {
        return Card(
          elevation: 20,
          child: Text(
            state.networkExceptions.toString(),
          ),
        );
      }
      return Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 1.0,
            enlargeCenterPage: true,
            viewportFraction: 0.7,
            enableInfiniteScroll: true,
            initialPage: 0,
          ),
          items: resultsSlider != null && resultsSlider!.isNotEmpty
              ? resultsSlider!
              : null,
        ),
      );
    });
  }
}
