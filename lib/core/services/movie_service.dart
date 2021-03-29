import 'dart:convert';
import 'dart:developer';

import 'package:get_movies/core/api_wrapper.dart';
import 'package:get_movies/core/models/models.dart';
import 'package:get_movies/core/urls.dart';
import 'package:get_movies/utils/utils.dart';
import 'package:http/http.dart' as http;

// movie category enum
enum MovieCategory { topRated, popular, upcoming }

class MovieService {

  // get movies based on categories [top rated, popular or upcoming]
  Future<ApiWrapper> getMovies(
      {required MovieCategory movieCategory, required int page}) async {
    ApiWrapper apiWrapper = ApiWrapper(error: false);

    var uri = getUriFromMovieCategory(movieCategory, page);

    try {
      var response = await http.get(uri);
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);

      // movie list to hold the results of the movies retrieved based on category
      List<Movie> movieList = [];

      // add items to the movie list
      for (Map<String, dynamic> map in decodedResponse['results']) {
        movieList.add(
          Movie.fromJson(map),
        );
      }
      print('${movieList.length} length of movie here');

      // assign the api wrapper data to the movie list
      apiWrapper.data = movieList;
      // get the total results of the search results
      apiWrapper.totalResults = decodedResponse['total_results'];
    } catch (e) {
      print('${e.toString()} error hehre');
      apiWrapper.error = true;
    }

    // log('${apiWrapper.data} when searching movies');
    return apiWrapper;
  }

  // searching of movies
  Future<ApiWrapper> searchMovies(
      {required String query, required int page}) async {
    ApiWrapper apiWrapper = ApiWrapper(error: false);

    var queryParameters = {
      'api_key': GetMoviesStrings.API_KEY,
      'language': 'en-US',
      'page': '$page',
      'include_adult': 'false',
      'query': query,
    };

    var uri =
        Uri.https(ApiUrls.baseUrl, ApiUrls.searchMoviesUrl, queryParameters);
    try {
      var response = await http.get(uri);
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);

      // movie list to hold the search results
      List<Movie> movieList = [];
      
      // add items to the movie list
      for (Map<String, dynamic> map in decodedResponse['results']) {
        movieList.add(
          Movie.fromJson(map),
        );
      }

      // assign the api wrapper data to the movie list
      apiWrapper.data = movieList;
      // get the total results of the search results
      apiWrapper.totalResults = decodedResponse['total_results'];
      log('$movieList when browsing movies');
    } catch (e) {
      apiWrapper.error = true;
    }

    return apiWrapper;
  }

  // get a uri based on a movie category [top rated, popular or upcoming]
  Uri getUriFromMovieCategory(MovieCategory movieCategory, int page) {
    var queryParameters = {
      'api_key': GetMoviesStrings.API_KEY,
      'language': 'en-US',
      'page': '$page',
    };
    late Uri uri;
    switch (movieCategory) {
      //  top rated
      case MovieCategory.topRated:
        uri = Uri.https(
          ApiUrls.baseUrl,
          ApiUrls.topRatedMoviesUrl,
          queryParameters,
        );
        break;
        // popular
      case MovieCategory.popular:
        uri = Uri.https(
          ApiUrls.baseUrl,
          ApiUrls.popularMoviesUrl,
          queryParameters,
        );
        break;
        // upcoming
      case MovieCategory.upcoming:
        uri = Uri.https(
          ApiUrls.baseUrl,
          ApiUrls.upcomingMoviesUrl,
          queryParameters,
        );
        break;
    }
    return uri;
  }
}
