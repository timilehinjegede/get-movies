import 'dart:convert';
import 'dart:developer';

import 'package:get_movies/core/api_wrapper.dart';
import 'package:get_movies/core/models/models.dart';
import 'package:get_movies/core/services/services.dart';
import 'package:get_movies/core/urls.dart';
import 'package:http/http.dart' as http;

enum MovieCategory { topRated, popular, upcoming }

class MovieService {
  Future<ApiWrapper> getMovies(
      {required MovieCategory movieCategory, required int page}) async {
    ApiWrapper apiWrapper = ApiWrapper(error: false);

    var uri = getUriFromMovieCategory(movieCategory, page);

    try {
      var response = await http.get(uri);
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);

      List<Movie> movieList = [];
      for (Map<String, dynamic> map in decodedResponse['results']) {
        movieList.add(
          Movie.fromJson(map),
        );
      }
      print('${movieList.length} length of movie here');

      apiWrapper.data = movieList;
      apiWrapper.totalResults = decodedResponse['total_results'];
    } catch (e) {
            print('${e.toString()} error hehre');
      apiWrapper.error = true;
    }

    // log('${apiWrapper.data} when searching movies');
    return apiWrapper;
  }

  Future<ApiWrapper> searchMovies({required String query, int page = 1}) async {
    ApiWrapper apiWrapper = ApiWrapper(error: false);

    var queryParameters = {
      'api_key': 'e7e9e4ba03bc22a6bcfa6ea40882715b',
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

      List<Movie> movieList = [];

      for (Map<String, dynamic> map in decodedResponse['results']) {
        movieList.add(
          Movie.fromJson(map),
        );
      }

      apiWrapper.data = movieList;
      apiWrapper.totalResults = decodedResponse['total_results'];
      log('$movieList when browsing movies');
    } catch (e) {
      apiWrapper.error = true;
    }

    return apiWrapper;
  }

  Uri getUriFromMovieCategory(MovieCategory movieCategory, int page) {
    var queryParameters = {
      'api_key': 'e7e9e4ba03bc22a6bcfa6ea40882715b',
      'language': 'en-US',
      'page': '$page',
    };
    late Uri uri;
    switch (movieCategory) {
      case MovieCategory.topRated:
        uri = Uri.https(
          ApiUrls.baseUrl,
          ApiUrls.topRatedMoviesUrl,
          queryParameters,
        );
        break;
      case MovieCategory.popular:
        uri = Uri.https(
          ApiUrls.baseUrl,
          ApiUrls.popularMoviesUrl,
          queryParameters,
        );
        break;
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
