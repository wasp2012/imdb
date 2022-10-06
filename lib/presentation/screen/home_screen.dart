// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../widget/movie_section_widget.dart';
import '../widget/nav_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = BlocProvider.of<NowPLayingMoviesCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('What\'s new?'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              MovieSectionWidget(sectionTitle: 'Now Playing', flag: 1),
              MovieSectionWidget(sectionTitle: 'Top Rated', flag: 2),
              MovieSectionWidget(sectionTitle: 'Popular', flag: 3),
              MovieSectionWidget(sectionTitle: 'Upcoming', flag: 4),
            ],
          ),
        ),
      ),
    );
  }
}
