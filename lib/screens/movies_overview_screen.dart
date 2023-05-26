import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/movies_grid.dart';

import './edit_movie_screen.dart';
import '../providers/movies.dart';

class MoviesOverviewScreen extends StatefulWidget {
  @override
  State<MoviesOverviewScreen> createState() => _MoviesOverviewScreenState();
}

class _MoviesOverviewScreenState extends State<MoviesOverviewScreen> {
  // ...
  var _showOnlyFavorites = false;
  var _isInit = true;

  @override
  void initState() {
    // Provider.of<Movies>(context).fetchAndSetMovies();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Movies>(context).fetchAndSetMovies();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Movies',
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditMovieScreen.routeName);
            },
          ),
        ],
      ),
      body: MoviesGrid(),
    );
  }
}
