import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/movies_overview_screen.dart';
import './screens/movie_detail_screen.dart';
import './providers/movies.dart';
import './screens/edit_movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Movies(),
      child: MaterialApp(
        title: 'Movies',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        home: MoviesOverviewScreen(),
        routes: {
          MovieDetailScreen.routeName: (ctx) => MovieDetailScreen(),
          EditMovieScreen.routeName: (ctx) => EditMovieScreen(),
        },
      ),
    );
  }
}
