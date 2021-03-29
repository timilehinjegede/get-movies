import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movies/core/api_wrapper.dart';
import 'package:get_movies/core/models/models.dart';
import 'package:get_movies/core/services/services.dart';
import 'package:get_movies/ui/screens/view_more_movies_screen.dart';
import 'package:get_movies/utils/utils.dart';
import 'package:http/http.dart' as http;

class MovieController extends GetxController {
  // returns the found instance of the movie controller
  static MovieController find = Get.find();

  // the controller for the search movie textfield
  late TextEditingController searchController;
  // instance of the movie service
  late final MovieService _movieService;
  // current page of the top rated movies list
  int topRatedPage = 1;
  // current page of the popular movies list
  int popularPage = 1;
  // current page of the upcoming movies list
  int upcomingPage = 1;
  // current page of the searched movies list
  int movieResultsPage = 1;

  // list of top rated movies
  List<Movie> topRatedMovies = [];
  // list of popular movies
  List<Movie> popularMovies = [];
  // list of upcoming movies
  List<Movie> upcomingMovies = [];
  // list of searched movies
  List<Movie> searchMovieResults = [];

  @override
  void onInit() {
    // creating an instance of the movie service
    _movieService = MovieService(client: http.Client());
    // creating an instance of the search controller
    searchController = TextEditingController();
    log('init');
    super.onInit();
  }

  @override
  void onReady() {
    log('ready');
    // get the top rated, popular and upcoming movies
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
    // disposing the search controller
    searchController.dispose();
    super.onClose();
  }

  // searching for a movie
  Future<void> searchMovies(String query, int page) async {
    // instance of the api wrapper
    late ApiWrapper apiWrapper;

    // show a loading dialog while searching movies
    GetMoviesHelpers.showLoadingDialog();

    // search movies
    apiWrapper = await _movieService.searchMovies(
      query: query,
      page: page,
    );

    if (!apiWrapper.error) {
      // assign the results/api data with the search movie results list
      searchMovieResults = apiWrapper.data;
      log('${apiWrapper.data} during searching movie');
      // dismiss the loading dialog
      GetMoviesHelpers.popPage();

      // navigate to the view more movies screen to see the results of the searched movie
      GetMoviesHelpers.navigateTo(
        ViewMoreMoviesScreen(
          movieList: searchMovieResults,
          movieCategory: query,
        ),
      );
    } else {
      // dismiss the loading dialog
      GetMoviesHelpers.popPage();

      // show an error dialog
      GetMoviesHelpers.showDefaultDialog(
        title: 'Error!',
        content: 'Error searching movie, try again.',
      );
    }
    update();
  }

  // get top rated movies
  Future<void> getTopRatedMovies(int page) async {
    ApiWrapper apiWrapper = await getMovie(MovieCategory.topRated, page);
    // add the items to the top rated movies list
    if (!apiWrapper.error) topRatedMovies.addAll(apiWrapper.data);
    log('$topRatedMovies here in top rated');
    update();
  }

  // get popular movies
  Future<void> getPopularMovies(int page) async {
    ApiWrapper apiWrapper = await getMovie(MovieCategory.popular, page);
    // add the items to the popular movies list
    if (!apiWrapper.error) popularMovies.addAll(apiWrapper.data);
    log('$popularMovies here in popular');
    update();
  }

  // get upcoming movies
  Future<void> getUpcomingMovies(int page) async {
    ApiWrapper apiWrapper = await getMovie(MovieCategory.upcoming, page);
    // add the items to the upcoming movies list
    if (!apiWrapper.error) upcomingMovies.addAll(apiWrapper.data);
    log('$upcomingMovies here in upcoming');
    update();
  }

  // get a specific movie category [top rated, popular or upcoming]
  Future<ApiWrapper> getMovie(MovieCategory movieCategory, int page) async {
    // instance of the apiwrapper
    late ApiWrapper apiWrapper;

    // show a loading dialog while fetching movies
    GetMoviesHelpers.showLoadingDialog();

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

    // dismiss the dialog
    GetMoviesHelpers.popPage();

    // return the instance of the api wrapper
    return apiWrapper;
  }
}
