import 'package:flutter/material.dart';
import 'package:rest_api_tutorial/models/movie.dart';
import 'package:rest_api_tutorial/screens/movie-tile.dart';
import 'package:rest_api_tutorial/shared/loading.dart';

class MovieList extends StatelessWidget {

  final Future<List<Movie>> moviesFuture;
  MovieList({ this.moviesFuture });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Movie> movies = snapshot.data ?? [];
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return MovieTile(movie: movies[index]);
            },
          );
        }
        else {
          return Loading();
        }
      }
    );
  }
}