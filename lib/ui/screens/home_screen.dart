import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_movies/core/controllers/movie_controller.dart';
import 'package:get_movies/core/models/models.dart';
import 'package:get_movies/ui/screens/movie_details_screen.dart';
import 'package:get_movies/ui/screens/view_more_movies_screen.dart';
import 'package:get_movies/ui/widgets/widgets.dart';
import 'package:get_movies/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  final MovieController _movieController =
      Get.put<MovieController>(MovieController());
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
                  _SearchMovieSection(
                    movieController: _movieController,
                  ),

                  YBox(20),

                  // top rated movies
                  HeaderInfo(
                    title: GetMoviesStrings.topRatedMovies,
                    subTitle: 'View and check top rated movies',
                    onTap: () {
                      GetMoviesHelpers.navigateTo(
                        ViewMoreMoviesScreen(
                          movieList: movieController.topRatedMovies,
                          movieCategory: GetMoviesStrings.topRatedMovies,
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
                    title: GetMoviesStrings.upcomingMovies,
                    subTitle: 'View and check new upcoming movies',
                    onTap: () {
                      GetMoviesHelpers.navigateTo(
                        ViewMoreMoviesScreen(
                          movieList: movieController.upcomingMovies,
                          movieCategory: GetMoviesStrings.upcomingMovies,
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
                    title: GetMoviesStrings.popularMovies,
                    subTitle: 'View and check most popular movies',
                    onTap: () {
                      GetMoviesHelpers.navigateTo(
                        ViewMoreMoviesScreen(
                          movieList: movieController.popularMovies,
                          movieCategory: GetMoviesStrings.popularMovies,
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

class _SearchMovieSection extends StatelessWidget {
  final MovieController movieController;

  const _SearchMovieSection({
    Key? key,
    required this.movieController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0),
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
                  controller: movieController.searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: whiteColor,
                    ),
                    hintText: 'Enter movie title',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        XBox(10),
        SizedBox(
          height: 55,
          child: TextButton(
            onPressed: () => movieController.searchMovies(
              movieController.searchController.text.trim(),
              1,
            ),
            style: TextButton.styleFrom(
              backgroundColor: yellowColor,
              primary: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              'Search',
              style: theme.textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        XBox(20),
      ],
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
                    onTap: () => GetMoviesHelpers.navigateTo(
                      MovieDetailsScreen(
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
