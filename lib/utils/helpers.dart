import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movies/utils/utils.dart';

class GetMoviesHelpers {
  const GetMoviesHelpers._();

  // show a loading dialog
  static Future<void> showLoadingDialog() {
    return Get.dialog(
      Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(whiteColor),
        ),
      ),
      barrierDismissible: false,
    );
  }

  // show a default dialog
  static Future<void> showDefaultDialog(
      {required String title, required String content}) {
    return Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(
        color: blackColor,
      ),
      content: Text(
        content,
        style: TextStyle(
          color: blackColor,
        ),
      ),
    );
  }

  // pop the current screen, page or dialog
  static popPage() => Get.back();

  // navigate to a page
  static navigateTo(Widget page) {
    Get.to(
      () => page,
    );
  }
}
