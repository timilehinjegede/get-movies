import 'package:flutter/material.dart';
import 'package:get_movies/utils/utils.dart';

class TrailerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 120,
      width: 240,
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
