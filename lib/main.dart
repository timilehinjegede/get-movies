import 'package:flutter/material.dart';
import 'package:get_movies/ui/screens/all_movies_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AllMoviesScreen(),
    );
  }
}
