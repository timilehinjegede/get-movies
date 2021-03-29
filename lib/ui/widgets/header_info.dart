import 'package:flutter/material.dart';
import 'package:get_movies/utils/utils.dart';

class HeaderInfo extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const HeaderInfo({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      onTap: onTap,
      title: Text(
        title,
        style: theme.textTheme.headline6!.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: theme.textTheme.bodyText1,
      ),
      trailing: Icon(
        Icons.arrow_forward,
        size: 22,
        color: whiteColor,
      ),
    );
  }
}
