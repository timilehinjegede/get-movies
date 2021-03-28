import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movies/core/api_wrapper.dart';
import 'package:get_movies/core/controllers/controllers.dart';
import 'package:get_movies/core/models/models.dart';
import 'package:get_movies/core/services/services.dart';
import 'package:get_movies/utils/utils.dart';

class MovieController extends GetxController {
  static MovieController find = Get.find();

  late TextEditingController searchController;
  late final MovieService _movieService;
  int topRatedPage = 1;
  int popularPage = 1;
  int upcomingPage = 1;

  List<Movie> topRatedMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> upcomingMovies = [];

  @override
  void onInit() {
    _movieService = MovieService();
    searchController = TextEditingController();
    print('init');
    super.onInit();
  }

  @override
  void onReady() {
    print('ready');
    Future.wait(
      <Future>[
        getTopRatedMovies(topRatedPage),
        getPopularMovies(popularPage),
        getUpcomingMovies(upcomingPage),
      ],
    );
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  // Future<List<Movie>> searchMovies() async {
  //   late ApiWrapper apiWrapper;

  //   apiWrapper = await _movieService.searchMovies(query: 'query');

  //   if (!apiWrapper.error) {
  //   } else {
  //     // show snackbar

  //   }
  // }

  // get top rated movies
  Future<void> getTopRatedMovies(int page) async {
    ApiWrapper apiWrapper = await getMovie(MovieCategory.topRated, page);
    topRatedMovies = topRatedMovies..addAll(apiWrapper.data);
    print('$topRatedMovies here in top rated');
    update();
  }

  // get popular movies
  Future<void> getPopularMovies(int page) async {
    ApiWrapper apiWrapper = await getMovie(MovieCategory.popular, page);
    popularMovies = popularMovies..addAll(apiWrapper.data);
    print('$popularMovies here in popular');
    update();
  }

  // get upcoming movies
  Future<void> getUpcomingMovies(int page) async {
    ApiWrapper apiWrapper = await getMovie(MovieCategory.upcoming, page);
    upcomingMovies = upcomingMovies..addAll(apiWrapper.data);
    print('$upcomingMovies here in upcoming');
    update();
  }

  // get a specific movie category
  Future<ApiWrapper> getMovie(MovieCategory movieCategory, int page) async {
    late ApiWrapper apiWrapper;

    Get.dialog(
      Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(whiteColor),
        ),
      ),
      barrierDismissible: false,
    );

    switch (movieCategory) {
      // get top rated movies
      case MovieCategory.topRated:
        apiWrapper = await _movieService.getMovies(
          movieCategory: MovieCategory.topRated,
          page: page,
        );
        break;
      // get popular movies
      case MovieCategory.popular:
        apiWrapper = await _movieService.getMovies(
          movieCategory: MovieCategory.popular,
          page: page,
        );
        break;
      // get upcoming movies
      case MovieCategory.upcoming:
        apiWrapper = await _movieService.getMovies(
          movieCategory: MovieCategory.upcoming,
          page: page,
        );
        break;
    }
    Get.back();

    return apiWrapper;
  }
}
