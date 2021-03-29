import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_movies/core/models/models.dart';
import 'package:get_movies/utils/utils.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({
    Key? key,
    required this.movie,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      highlightColor: transparentColor,
      splashColor: transparentColor,
      child: Container(
        height: 280,
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: movie.posterPath == null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Movie Poster not available',
                            style: theme.textTheme.bodyText1!.copyWith(
                              color: blackColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : CachedNetworkImage(
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
                            color: redColor,
                            size: 30,
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            YBox(5),
            Text(
              movie.title!,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyText1!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            YBox(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                  style: theme.textTheme.bodyText1,
                ),
              ],
            ),
            YBox(5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  movie.releaseDate!,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyText1,
                ),
                Text(
                  movie.originalLanguage!,
                  style: theme.textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
