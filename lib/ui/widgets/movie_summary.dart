import 'package:flutter/material.dart';
import 'package:get_movies/core/models/models.dart';
import 'package:get_movies/utils/utils.dart';

class MovieSummary extends StatelessWidget {
  final Movie movie;

  const MovieSummary({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // hint style [in grey]
    final hintStyle = theme.textTheme.bodyText1!.copyWith(color: greyColor);
    // text style [in white]
    final textStyle = theme.textTheme.subtitle1!
        .copyWith(fontWeight: FontWeight.w600, height: 1.6);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        Text(
          'Original Title',
          style: hintStyle,
        ),
        Text(
          movie.originalTitle!,
          style: theme.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w600,
            height: 1.6,
          ),
        ),
        Divider(),
        Text(
          'Overview',
          style: hintStyle,
        ),
        Text(
          movie.overview!,
          style: theme.textTheme.subtitle1!.copyWith(
            height: 1.5,
          ),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Movie ID',
              style: hintStyle,
            ),
            Text(
              movie.id.toString(),
              style: textStyle,
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Release Date',
              style: hintStyle,
            ),
            Text(
              movie.releaseDate!,
              style: textStyle,
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Original Language',
              style: hintStyle,
            ),
            Text(
              movie.originalLanguage!,
              style: textStyle,
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Vote Average',
              style: hintStyle,
            ),
            Text(
              movie.voteAverage!.toString(),
              style: textStyle,
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ratings',
              style: hintStyle,
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
              style: textStyle,
            ),
          ],
        ),
      ],
    );
  }
}
