import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/widgets.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies in Theaters'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              // * a Delegate is a class or widget that requires certain methods to be implemented (conditions)
              delegate: MovieSearchDelegate(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* Principal cards
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //* Slider of the movies
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Popular movies',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
