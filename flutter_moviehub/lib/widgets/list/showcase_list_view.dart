// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/constants/fonts.dart';
import 'package:flutter_moviehub/model/models.dart';
import 'package:flutter_moviehub/widgets/items/showcase_item_view_shimmer.dart';
import 'package:flutter_moviehub/widgets/items/showcase_item_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ShowcaseListView extends StatefulWidget {
  final AsyncSnapshot<MovieList> listItems;

  const ShowcaseListView({Key key, this.listItems}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShowcaseListViewState();
  }
}

class ShowcaseListViewState extends State<ShowcaseListView> {
  String currentMovieTitle = '';
  String currentMovieDescription = '';
  double currentMovieRating = 0.0;

  @override
  Widget build(BuildContext context) {
    if (widget.listItems.hasData) {
      // Populate list view with the data
      return _buildShowcaseListView(context, widget.listItems.data);
    } else if (widget.listItems.hasError) {
      // Display loading indicator
      return Center(child: Text(widget.listItems.error.toString()));
    }
    // Display shimmer loading view
    return _buildShowcaseListShimmerView(context);
  }

  onShowcasedMovieChanged(Movie movie) {
    setState(() {
      currentMovieTitle = movie.title;
      currentMovieDescription = movie.overview;
      currentMovieRating = movie.voteAverage / 2;
    });
  }

  Widget _buildShowcaseListView(BuildContext context, MovieList movies) {
    return Container(
      child: Column(
        children: <Widget>[
          // https://pub.dartlang.org/packages/carousel_slider
          CarouselSlider(
            options: CarouselOptions(
              height: 175,
              viewportFraction: 0.6,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              // autoPlayCurve: Curve.fastOutSlowIn,
              // pauseAutoPlayOnTouch: Duration(seconds: 10),
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                var movie = movies.results[index];
                onShowcasedMovieChanged(movie);
              },
              scrollDirection: Axis.horizontal,
            ),
            items: movies.results.map(
              (movie) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width / 1.25,
                      child: buildShowcaseItemView(context, movie),
                    );
                  },
                );
              },
            ).toList(),
          ),
          _buildMovieShowcaseDetailsView(),
        ],
      ),
    );
  }

  Widget _buildMovieShowcaseDetailsView() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            currentMovieTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          // https://stackoverflow.com/questions/44579918/flutter-insert-overflow-ellipsis-in-text
          Text(
            currentMovieDescription,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          Row(
            children: <Widget>[
              TextButton.icon(
                // padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.timer,
                  color: Colors.white,
                  size: 16,
                ),
                // color: Colors.transparent,
                label: Text(
                  'Watch Later',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontFamily: Fonts.OPEN_SANS,
                  ),
                ),
                onPressed: () {},
              ),
              TextButton.icon(
                // padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 16,
                ),
                // color: Colors.transparent,
                label: Text(
                  'Info',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontFamily: Fonts.OPEN_SANS,
                  ),
                ),
                onPressed: () {},
              ),
              SmoothStarRating(
                rating: currentMovieRating,
                allowHalfRating: true,
                size: 12,
                starCount: 5,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShowcaseListShimmerView(BuildContext context) {
    var shimmerResults = [];
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 175,
              viewportFraction: 0.6,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: shimmerResults.map(
              (item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width / 1.25,
                      child: buildShowcaseItemShimmerView(),
                    );
                  },
                );
              },
            ).toList(),
          ),
          _buildMovieShowcaseDetailsShimmerView(context),
        ],
      ),
    );
  }

  Widget _buildMovieShowcaseDetailsShimmerView(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[900],
        highlightColor: Colors.grey[850],
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 200,
                height: 12.0,
                color: Colors.grey[900],
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                width: 325,
                height: 40.0,
                color: Colors.grey[900],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
