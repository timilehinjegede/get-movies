import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movies/core/models/models.dart';
import 'package:get_movies/utils/utils.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.5,
            child: Stack(
              children: [
                Container(
                  height: Get.height * 0.4,
                  color: greyColor,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/original${movie.backdropPath!}',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 30,
                  child: Container(
                    height: 220,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 210,
                        decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/original${movie.posterPath!}',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          YBox(25),
          Expanded(
            child: _MovieInformation(
              movie: movie,
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieInformation extends StatelessWidget {
  final Movie movie;

  const _MovieInformation({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        Text(
          'Original Title',
        ),
        Text(
          movie.originalTitle!,
        ),
        YBox(5),
        Text(
          'Overview',
        ),
        Text(
          movie.overview!,
        ),
        YBox(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Movie ID',
            ),
            Text(
              movie.id.toString(),
            ),
          ],
        ),
        YBox(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Release Date',
            ),
            Text(
              movie.releaseDate!,
            ),
          ],
        ),
        YBox(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Original Language',
            ),
            Text(
              movie.originalLanguage!,
            ),
          ],
        ),
        YBox(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Vote Average',
            ),
            Text(
              movie.voteAverage!.toString(),
            ),
          ],
        ),
        YBox(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ratings',
            ),
            Spacer(),
            for (int i = 1; i < (movie.voteAverage / 2.floor()); i++)
              Icon(
                Icons.star,
                color: yellowColor,
                size: 14,
              ),
            movie.voteAverage / 2.floor() == 0
                ? Icon(
                    Icons.star,
                    color: yellowColor,
                    size: 14,
                  )
                : SizedBox.shrink(),
            XBox(2),
            Text(
              '${(movie.voteAverage / 2).floor().toString()}.0',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
