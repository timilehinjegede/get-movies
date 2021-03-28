import 'package:flutter/material.dart';
import 'package:get_movies/ui/widgets/widgets.dart';
import 'package:get_movies/utils/utils.dart';

class MovieDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: MySliverAppBar(expandedHeight: 250),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    YBox(100),
                    _buildContent(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMovieIntroduction(),
          YBox(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  'Casts',
                ),
              ),
              YBox(5),
              Container(
                height: 150,
                width: double.infinity,
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: [
                    CastCard(),
                    XBox(15),
                    CastCard(),
                    XBox(15),
                    CastCard(),
                  ],
                ),
              ),
            ],
          ),
          YBox(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  'Trailers',
                ),
              ),
              YBox(5),
              Container(
                height: 160,
                width: double.infinity,
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: [
                    TrailerCard(),
                    XBox(15),
                    TrailerCard(),
                    XBox(15),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMovieIntroduction() {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Introduction',
          ),
          YBox(5),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id varius dolor. Sed ornare justo sit amet arcu tempus laoreet. Integer vitae turpis non magna aliquam pretium. Pellentesque laoreet placerat diam tincidunt facilisis. Nulla commodo maximus odio luctus vestibulum. Nunc tempor, tellus ac laoreet lacinia, nulla nisl eleifend nisl, pulvinar.',
          ),
        ],
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final dims = Dims(context);
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: greyColor,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "Movie Title",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - shrinkOffset + 20,
          left: dims.screenWidth(extent: 0.6),
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: MovieSummary(),
          ),
        ),
        Positioned(
          top: expandedHeight / 1.8 - shrinkOffset,
          left: dims.screenWidth(extent: 0.05),
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              child: Container(
                height: 220,
                width: 150,
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 90;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
