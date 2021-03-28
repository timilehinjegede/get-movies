import 'package:flutter/material.dart';
import 'package:get_movies/ui/widgets/widgets.dart';
import 'package:get_movies/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              YBox(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: whiteColor,
                    ),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: whiteColor,
                        ),
                        hintText: 'Search movies',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              YBox(20),
              HeaderInfo(
                title: 'Latest movies',
                subTitle: 'latest movies',
                movieId: '',
              ),
              Container(
                height: 280,
                width: double.infinity,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: 20.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => MovieCard(),
                ),
              ),
              YBox(20),
              HeaderInfo(
                title: 'Top rated movies',
                subTitle: 'top rated movies',
                movieId: '',
              ),
              Container(
                height: 280,
                width: double.infinity,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: 20.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => MovieCard(),
                ),
              ),
              YBox(20),
              HeaderInfo(
                title: 'Upcoming movies',
                subTitle: 'upcoming movies',
                movieId: '',
              ),
              Container(
                height: 280,
                width: double.infinity,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: 20.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => MovieCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
