import 'package:flutter/foundation.dart';

class Movie {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
