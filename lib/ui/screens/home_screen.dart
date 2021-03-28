import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_movies/core/controllers/movie_controller.dart';
import 'package:get_movies/core/models/models.dart';
import 'package:get_movies/core/services/movie_service.dart';
import 'package:get_movies/ui/screens/movie_details_screen.dart';
import 'package:get_movies/ui/screens/view_more_movies_screen.dart';
import 'package:get_movies/ui/widgets/widgets.dart';
import 'package:get_movies/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  final MovieController _movieController = MovieController.find;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      init: MovieController(),
      builder: (movieController) => Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  YBox(30),

                  // search movies
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: whiteColor,
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _movieController.searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: whiteColor,
                            ),
                            hintText: 'Search movies',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  YBox(20),

                  // top rated movies
                  HeaderInfo(
                    title: 'Top rated movies',
                    subTitle: 'top rated movies',
                    onPressed: () {
                      Get.to(
                        () => ViewMoreMoviesScreen(
                          movieList: movieController.topRatedMovies,
                          movieCategory: 'Top Rated Movies',
                        ),
                      );
                    },
                  ),

                  // top rated movie row
                  _BuildMovieRow(
                    movieList: movieController.topRatedMovies,
                  ),

                  YBox(20),

                  // upcoming movies
                  HeaderInfo(
                    title: 'Upcoming movies',
                    subTitle: 'upcoming movies',
                    onPressed: () {
                      Get.to(
                        () => ViewMoreMoviesScreen(
                          movieList: movieController.upcomingMovies,
                          movieCategory: 'Upcoming Movies',
                        ),
                      );
                    },
                  ),

                  // upcoming movie row
                  _BuildMovieRow(
                    movieList: movieController.upcomingMovies,
                  ),

                  YBox(20),

                  // popular movies
                  HeaderInfo(
                    title: 'Popular movies',
                    subTitle: 'Popular movies',
                    onPressed: () {
                      Get.to(
                        () => ViewMoreMoviesScreen(
                          movieList: movieController.popularMovies,
                          movieCategory: 'Popular Movies',
                        ),
                      );
                    },
                  ),
                  // popular movie row
                  _BuildMovieRow(
                    movieList: movieController.popularMovies,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildMovieRow extends StatelessWidget {
  final List<Movie> movieList;

  const _BuildMovieRow({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      child: movieList.isEmpty
          ? Center(
              child: Text(
                'Movies not available',
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.only(left: 20.0),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Row(
                children: [
                  MovieCard(
                    movie: movieList[index],
                    onTap: () => Get.to(
                      () => MovieDetailsScreen(
                        movie: movieList[index],
                      ),
                    ),
                  ),
                  XBox(15),
                ],
              ),
            ),
    );
  }
}
