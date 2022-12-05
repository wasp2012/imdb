import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/data/models/movies/results.dart';
import '../../business_logic/movies_cubitt/movies_cubit/movies_cubit.dart';
import '../../business_logic/movies_cubitt/movies_cubit/movies_state.dart';
import '../../injection.dart';
import 'movies_grid.dart';

class MovieSectionWidget extends StatefulWidget {
  final String? sectionTitle;
  final List<Results>? moviesList;
  final double? adaptiveHeight;

  const MovieSectionWidget({
    super.key,
    required this.sectionTitle,
    required this.moviesList,
    required this.adaptiveHeight,
  });

  @override
  State<MovieSectionWidget> createState() => _MovieSectionWidgetState();
}

class _MovieSectionWidgetState extends State<MovieSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.sectionTitle}! ",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..color = Theme.of(context).indicatorColor
                      ..strokeWidth = 1.1,
                  ),
            ),
            SizedBox(
              height: widget.adaptiveHeight?.h,
              child: widget.moviesList!.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 1,
                        crossAxisCount: 1,
                        childAspectRatio: 1.22,
                        mainAxisSpacing: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.moviesList!.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MoviesGridWidget(
                          movie: widget.moviesList![index],
                        );
                      },
                    )
                  : Container(),
            ),
          ],
        );
      },
    );
  }
}
