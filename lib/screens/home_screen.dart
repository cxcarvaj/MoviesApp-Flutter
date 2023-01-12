import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

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
            onPressed: () {},
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
