import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class Movies with ChangeNotifier {
  List<Movie> _items = [
    // Movie(
    //   id: 'm1',
    //   title: '3 idiots',
    //   description: 'Amir Khan, Kareena Kapoor',
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Movie(
    //   id: 'm2',
    //   title: 'RRR',
    //   description: 'Ram Charan, Jr NTR, Alia Bhatt',
    //   imageUrl:
    //       'https://m.media-amazon.com/images/M/MV5BOTk5ODg0OTU5M15BMl5BanBnXkFtZTgwMDQ3MDY3NjM@._V1_QL50_SY1000_CR0,0,674,1000_AL_.jpg ',
    // ),
    // Movie(
    //   id: 'm3',
    //   title: 'Bahubali',
    //   description: 'Prabhas, Anushka Shetty',
    //   imageUrl:
    //       'https://m.media-amazon.com/images/M/MV5BOTk5ODg0OTU5M15BMl5BanBnXkFtZTgwMDQ3MDY3NjM@._V1_UX182_CR0,0,182,268_AL_.jpg ',
    // ),
    // Movie(
    //   id: 'm4',
    //   title: 'Welcome',
    //   description: 'Akshay Kumar, Katrina Kaif',
    //   imageUrl:
    //       'https://m.media-amazon.com/images/M/MV5BMTcwMjIyMTc2Nl5BMl5BanBnXkFtZTcwOTQyMzc5Mw@@._V1_SY1000_CR0,0,675,1000_AL_.jpg ',
    // ),
  ];

  List<Movie> get items {
    return [..._items];
  }

  Movie findById(String id) {
    return _items.firstWhere((mov) => mov.id == id);
  }

  Future<void> fetchAndSetMovies() async {
    final url =
        'https://flutter-movies-app-7c298-default-rtdb.firebaseio.com/movies.json';
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Movie> loadedMovies = [];
    extractedData.forEach((movId, movData) {
      loadedMovies.add(
        Movie(
          id: movId,
          title: movData['title'],
          description: movData['description'],
          imageUrl: movData['imageUrl'],
        ),
      );
    });
    _items = loadedMovies;
    notifyListeners();
  }

  void addMovie(Movie movie) {
    final url =
        'https://flutter-movies-app-7c298-default-rtdb.firebaseio.com/movies.json';
    http
        .post(
      Uri.parse(url),
      body: json.encode({
        'title': movie.title,
        'description': movie.description,
        'imageUrl': movie.imageUrl,
      }),
    )
        .then((response) {
      final newMovie = Movie(
        id: json.decode(response.body)['name'],
        title: movie.title,
        description: movie.description,
        imageUrl: movie.imageUrl,
      );
      _items.add(newMovie);
      notifyListeners();
    });
  }
}
