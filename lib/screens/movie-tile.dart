import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {

  final movie;
  MovieTile({ this.movie });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)
        )
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Image.network(movie.poster),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Text(movie.title, textDirection: TextDirection.ltr),
          )
        ],
      ),
    );
  }
}