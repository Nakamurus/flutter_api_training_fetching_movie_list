import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rest_api_tutorial/models/movie.dart';

class ApiService {
  final String url = "https://movie-database-imdb-alternative.p.rapidapi.com/?s=Avengers&page=1&r=json";
  static String rapidapiKey = DotEnv().env['RAPIDAPI_KEY'];
  final Map<String, String> header = {
    "x-rapidapi-key": rapidapiKey,
    "x-rapidapi-host": "movie-database-imdb-alternative.p.rapidapi.com"
  };

  List<Movie> _movieListFromResponse(String movies) {
    final parsed = json.decode(movies)['Search'].cast<Map<String, dynamic>>();
    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> getMovieList() async {
    try {
      final res = await http.get(url, headers: header);
      return _movieListFromResponse(res.body);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}
