import 'package:get/get.dart';
import 'package:get_movies/ui/screens/home_screen.dart';
import 'package:get_movies/ui/screens/movie_details_screen.dart';
import 'package:get_movies/ui/screens/splash_screen.dart';
import 'package:get_movies/ui/screens/view_more_movies_screen.dart';

const String splashRoute = '/';
const String homeScreen = '/homeScreen';
const String viewMoreMoviesRoute = '/viewmoremovies';
const String movieDetailsRoute = '/moviedetails';

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
