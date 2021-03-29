import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movies/ui/screens/home_screen.dart';
import 'package:get_movies/utils/assets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _loadSplash();
  }

  void _loadSplash() {
    const duration = Duration(seconds: 2);
    Timer(
      duration,
      () {
        Get.to(
          () => HomeScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          GetMoviesAssets.appIcon,
        ),
      ),
    );
  }
}
