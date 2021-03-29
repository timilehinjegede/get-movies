import 'package:flutter/material.dart';
import 'package:get_movies/utils/utils.dart';

class HeaderInfo extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onPressed;

  const HeaderInfo({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
        ),
        subtitle: Text(
          subTitle,
        ),
        trailing: IconButton(
          onPressed: onPressed,
          splashRadius: 20,
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_forward,
            size: 22,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
