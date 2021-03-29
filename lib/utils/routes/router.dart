import 'package:get/get.dart';
import 'package:get_movies/ui/screens/home_screen.dart';
import 'package:get_movies/ui/screens/movie_details_screen.dart';
import 'package:get_movies/ui/screens/splash_screen.dart';
import 'package:get_movies/ui/screens/view_more_movies_screen.dart';
import 'package:get_movies/utils/routes/routes.dart';

class GetMoviesRoutes {
  GetMoviesRoutes._();
  static final routes = <GetPage>[
    GetPage(
      name: splashRoute,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: viewMoreMoviesRoute,
      page: () => ViewMoreMoviesScreen(),
    ),
    GetPage(
      name: movieDetailsRoute,
      page: () => MovieDetailsScreen(),
    ),
  ];
}
