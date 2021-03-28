import 'package:flutter/material.dart';
import 'package:get_movies/utils/utils.dart';

class MovieSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Movie Name',
        ),
        YBox(6),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 14,
            ),
            XBox(2),
            Text(
              'Rate',
            ),
          ],
        ),
        YBox(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '2H 34M',
            ),
            XBox(10),
            Text(
              'Comedy',
            ),
          ],
        ),
      ],
    );
  }
}
