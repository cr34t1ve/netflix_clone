import 'dart:convert';

import 'package:netflix_clone/enum/tmbd_apikey.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:http/http.dart' as http;

class AssistantMethods {
  Future<Movies> getTrendingMovies() async {
    var url =
        'https://api.themoviedb.org/3/trending/all/week?api_key=$tmbdKey';
    http.Response response = await http.get(Uri.parse(url));
    Movies movies = Movies.fromJson(jsonDecode(response.body));
    return movies;
  }

  Future<Movies> getTrendingTV() async {
    var url =
        "https://api.themoviedb.org/3/trending/tv/week?api_key=$tmbdKey";
    http.Response response = await http.get(Uri.parse(url));
    Movies movies = Movies.fromJson(jsonDecode(response.body));
    return movies;
  }

  Future<Movies> getUpcomingMovies() async {
    var url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$tmbdKey&language=en-US&page=1';
    http.Response response = await http.get(Uri.parse(url));
    Movies movies = Movies.fromJson(jsonDecode(response.body));
    return movies;
  }

  Future<Movies> getPopularMovies() async {
    var url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$tmbdKey&language=en-US&page=1';
    http.Response response = await http.get(Uri.parse(url));
    Movies movies = Movies.fromJson(jsonDecode(response.body));
    return movies;
  }
}
