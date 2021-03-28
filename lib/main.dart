import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movies/utils/utils.dart';

void main() async {
  // put your controllers here
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Movies',
      theme: GetMoviesTheme.getMoviesThemeData,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: GetMoviesRoutes.routes,
      initialRoute: splashRoute,
    );
  }
}
