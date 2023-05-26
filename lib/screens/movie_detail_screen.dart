import 'package:flutter/material.dart';
import '../providers/movies.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movie-detail';

  @override
  Widget build(BuildContext context) {
    final movieId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final loadedMovie = Provider.of<Movies>(
      context,
      listen: false,
    ).findById(movieId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedMovie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedMovie.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: double.infinity,
              child: Text(
                loadedMovie.title,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: double.infinity,
              child: Text(
                loadedMovie.description,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
