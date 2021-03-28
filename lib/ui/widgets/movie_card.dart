import 'package:flutter/material.dart';
import 'package:get_movies/utils/utils.dart';

class MovieCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        height: 280,
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 210,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            YBox(5),
            Text(
              'Movie Name',
            ),
            YBox(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: yellowColor,
                  size: 14,
                ),
                XBox(2),
                Text(
                  'Rate',
                ),
              ],
            ),
            YBox(5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '2H 34M',
                ),
                Text(
                  'Comedy',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
