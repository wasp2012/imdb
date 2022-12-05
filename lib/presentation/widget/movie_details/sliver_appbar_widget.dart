import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/movies_cubitt/movie_detail_cubit/movie_details_cubit.dart';
import '../../../shared/constants/strings.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    Key? key,
    required this.movieCubit,
  }) : super(key: key);

  final MovieDetailsCubit movieCubit;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Theme.of(context).backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          collapseMode: CollapseMode.parallax,
          title: Container(
            child: Text(
              '${movieCubit.movieDetailsModel!.title}',
              style: TextStyle(
                  color: Colors.cyan.shade600,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp),
            ),
          ),
          background: movieCubit.movieDetailsModel!.posterPath!.isNotEmpty &&
                  movieCubit.movieDetailsModel!.posterPath != null
              ? Image.network(
                  '$imageDisplay${movieCubit.movieDetailsModel!.posterPath}',
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                )
              : Image.asset('assets/images/placeholder.gif')),
    );
  }
}
