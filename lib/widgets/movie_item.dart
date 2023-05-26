import 'package:flutter/material.dart';

import '../screens/movie_detail_screen.dart';

class MovieItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  MovieItem(
    this.id,
    this.title,
    this.description,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            MovieDetailScreen.routeName,
            arguments: id,
          );
        },
        child: Image.network(imageUrl),
      ),
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              title,
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
