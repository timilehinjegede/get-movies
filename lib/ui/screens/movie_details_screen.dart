import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movies/core/models/models.dart';
import 'package:get_movies/ui/widgets/widgets.dart';
import 'package:get_movies/utils/utils.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie? movie;

  const MovieDetailsScreen({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                  child: movie!.backdropPath == null
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
                              'https://image.tmdb.org/t/p/original${movie!.backdropPath!}',
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
                        color: blackColor,
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
                        child: movie!.posterPath == null
                            ? Center(
                                child: Text(
                                  'Movie Poster not available',
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    color: blackColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    'https://image.tmdb.org/t/p/original${movie!.posterPath!}',
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
                  ),
                ),
              ],
            ),
          ),
          YBox(25),
          Expanded(
            child: MovieSummary(
              movie: movie!,
            ),
          ),
        ],
      ),
    );
  }
}
