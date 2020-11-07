import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_tutorial/screens/movie-list.dart';
import 'package:rest_api_tutorial/services/api.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: MovieList(moviesFuture: ApiService().getMovieList()),
    )
    );
  }
}