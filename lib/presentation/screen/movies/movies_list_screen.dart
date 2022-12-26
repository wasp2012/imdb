import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/business_logic/movies_cubitt/movies_cubit/movies_cubit.dart';
import 'package:imdb_demo/business_logic/movies_cubitt/movies_cubit/movies_state.dart';
import 'package:imdb_demo/presentation/widget/movies_list_widget.dart';
import 'package:imdb_demo/shared/common/gradient.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({Key? key, required this.cubit}) : super(key: key);
  final MoviesCubit cubit;

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  @override
  void initState() {
    widget.cubit.searchTextController.clear();
    widget.cubit.searchedMovies = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: SharedGradient.gradientColors(context),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) async {
                  await widget.cubit.emitSearchedMovies(value);
                },
                controller: widget.cubit.searchTextController,
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
                  if (!currentFocus.hasPrimaryFocus ||
                      !currentFocus.isFirstFocus) {
                    currentFocus.unfocus();
                  }
                },
              ),
              widget.cubit.searchedMovies!.isNotEmpty &&
                      widget.cubit.searchedMovies != null
                  ? BlocBuilder<MoviesCubit, MoviesState>(
                      builder: (context, state) {
                        if (state is MoviesStateIdle) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is MoviesStateSearchingStarted) {
                          return MoviesListWidget(
                              totalResults: widget.cubit.searchedMovies);
                        } else if (state is MoviesStateError) {
                          return const Center(
                            child: Text('Something went wrong'),
                          );
                        } else {
                          return MoviesListWidget(
                              totalResults: widget.cubit.searchedMovies);
                        }
                      },
                    )
                  : const Center(
                      child: Text('Search for something'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
