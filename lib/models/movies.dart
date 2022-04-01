import 'package:flutter/material.dart';

class Movies extends ChangeNotifier {
  final List<MoviesList>? results;

  Movies({required this.results});

  factory Movies.fromJson(Map<String?, dynamic> parsedJson) {
    return Movies(
        results: (parsedJson['forecast']['forecastday'] as List)
            .map((i) => MoviesList.fromJson(i))
            .toList());
  }
}

class MoviesList {
  final bool? adult;
  final String? title;
  final String? posterPath;
  final String? overview;
  final String? mediaType;

  MoviesList(
      {this.adult, this.title, this.posterPath, this.overview, this.mediaType});

  factory MoviesList.fromJson(Map<String, dynamic> parsedJson) {
    return MoviesList(
        adult: parsedJson['adult'],
        title: parsedJson['original_title'],
        posterPath: parsedJson['poster_path'],
        overview: parsedJson['overview'],
        mediaType: parsedJson['media_type']);
  }
}
