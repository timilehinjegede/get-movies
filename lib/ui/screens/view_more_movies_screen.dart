import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movies/core/controllers/movie_controller.dart';
import 'package:get_movies/core/models/models.dart';
import 'package:get_movies/ui/screens/movie_details_screen.dart';
import 'package:get_movies/ui/widgets/widgets.dart';

class ViewMoreMoviesScreen extends StatelessWidget {
  final List<Movie> movieList;
  final String movieCategory;

  const ViewMoreMoviesScreen({
    Key? key,
    required this.movieList,
    required this.movieCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      init: MovieController(),
      builder: (movieController) => Scaffold(
        appBar: AppBar(
          title: Text(
            movieCategory,
          ),
          brightness: Brightness.dark,
        ),
        body: movieList.isEmpty
            ? Center(
                child: Text('No movies found'),
              )
            : SafeArea(
                top: false,
                child: NotificationListener<ScrollNotification>(
                  onNotification: _onScrollNotification,
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) => MovieCard(
                      movie: movieList[index],
                      onTap: () => Get.to(
                        () => MovieDetailsScreen(
                          movie: movieList[index],
                        ),
                      ),
                    ),
                    itemCount: movieList.length,
                  ),
                ),
              ),
      ),
    );
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      final before = notification.metrics.extentBefore;
      final max = notification.metrics.maxScrollExtent;

      if (before == max) {
        print('loading more...');
        _loadMoreMovies();
        print('loading more done');
      }
    }
    return false;
  }

  Future<void> _loadMoreMovies() async {
    MovieController movieController = MovieController.find;

    if (movieCategory == 'Upcoming Movies') {
      await movieController.getUpcomingMovies(++movieController.upcomingPage);
    } else if (movieCategory == 'Top Rated Movies') {
      await movieController.getTopRatedMovies(++movieController.topRatedPage);
    } else if (movieCategory == 'Popular Movies') {
      await movieController.getPopularMovies(++movieController.popularPage);
    } else {
      await movieController.searchMovies(
        movieCategory,
        ++movieController.movieResultsPage,
      );
    }
  }
}
