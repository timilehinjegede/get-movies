import 'package:flutter/material.dart';
import 'package:get_movies/utils/utils.dart';

const Color blackColor = Color(0xFF000000);
const Color whiteColor = Color(0xFFFFFFFF);
const Color greyColor = Colors.grey;
const Color transparentColor = Colors.transparent;
const Color yellowColor = Color(0xFFFDBA01);
const Color redColor = Colors.red;

class GetMoviesTheme {
  GetMoviesTheme._();

  static ThemeData getMoviesThemeData = _buildGetMoviesThemeData();

  static ThemeData _buildGetMoviesThemeData() {
    final baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      primaryColor: blackColor,
      buttonColor: yellowColor,
      scaffoldBackgroundColor: blackColor,
      primaryColorLight: blackColor,
      dividerColor: greyColor,
      accentColor: blackColor,
      primaryIconTheme: IconThemeData().copyWith(color: whiteColor),
      iconTheme: IconThemeData().copyWith(color: whiteColor),
      textTheme: _buildGetMoviesTextTheme(baseTheme.textTheme),
    );
  }

  static TextTheme _buildGetMoviesTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline6: base.headline6!.copyWith(
            fontSize: 18,
            color: whiteColor,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: base.bodyText1!.copyWith(
            color: whiteColor,
          ),
          subtitle1: base.subtitle1!.copyWith(
            color: whiteColor,
          ),
          caption: base.caption!.copyWith(
            color: greyColor,
          ),
        )
        .apply(
          fontFamily: GetMoviesStrings.sourceSansPro,
          bodyColor: whiteColor,
        );
  }
}
