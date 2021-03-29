import 'package:flutter_test/flutter_test.dart';
import 'package:get_movies/core/services/movie_service.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  MockHttpClient _mockHttpClient;
  // ignore: unused_local_variable
  late MovieService _movieService;

  setUp(
    () {
      _mockHttpClient = MockHttpClient();
      _movieService = MovieService(client: _mockHttpClient);
    },
  );

  group('Movie Service Test', () {
    test(
      'An ApiWrapper instance with the data as a list of movies should be returned when searching movies',
      () async {},
    );
    test(
      'An empty list should be returned if a search isn\'t found in the data field of the ApiWrapper instance',
      () async {},
    );
    test(
      'An ApiWrapper instance with error set to true should be returned if an error occured when searching movies',
      () async {},
    );
    test(
      'An ApiWrapper instance with the data as a list of movies should be returned when getting movies by category',
      () async {},
    );
    test(
      'An ApiWrapper instance with error set to true should be returned if an error occured when getting movies by category',
      () async {},
    );
  });
}
