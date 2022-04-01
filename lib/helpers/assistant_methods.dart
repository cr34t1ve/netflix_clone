import 'dart:convert';

import 'package:netflix_clone/enum/tmbd_apikey.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:http/http.dart' as http;

class AssistantMethods {
  Future<Movies> getTrendingMovies() async {
    var url =
        'https://api.themoviedb.org/3/trending/movie/week?api_key=$tmbdKey';
    http.Response response = await http.get(Uri.parse(url));
    Movies _weather = Movies.fromJson(jsonDecode(response.body));
    return _weather;
  }
}
