import 'package:flutter/material.dart';
import 'package:get_movies/utils/utils.dart';

class CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        YBox(5),
        Text(
          'Iron Man',
        ),
      ],
    );
  }
}
