import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies.dart';
import 'package:provider/provider.dart';

import '../providers/movies.dart';
import './movie_item.dart';

class MoviesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<Movies>(context);
    final movies = moviesData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: movies.length,
      itemBuilder: (ctx, i) => MovieItem(
        movies[i].id,
        movies[i].title,
        movies[i].description,
        movies[i].imageUrl,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
      ),
    );
  }
}
