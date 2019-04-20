// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/blocs/movie_list_bloc.dart';
import 'package:flutter_moviehub/model/models.dart';
import 'package:flutter_moviehub/widgets/items/showcase_item_view.dart';
import 'package:flutter_moviehub/widgets/list/base_list_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ShowcaseListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShowcaseListViewState();
  }
}

class ShowcaseListViewState extends BaseListView<ShowcaseListView, MovieList> {
  @override
  Widget build(BuildContext context) {
    // TODO: Convert to dynamic movie type
    movieListBloc.getPopularMovies();
    return StreamBuilder(
      stream: movieListBloc.popularMoviesList,
      builder: (context, AsyncSnapshot<MovieList> snapshot) {
        if (snapshot.hasData) {
          return buildListView(snapshot, context);
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  Widget buildListView(
    AsyncSnapshot<MovieList> snapshot,
    BuildContext context,
  ) {
    return Column(
      children: <Widget>[
        // https://pub.dartlang.org/packages/carousel_slider
        CarouselSlider(
          height: 150,
          viewportFraction: 0.4,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          // autoPlayCurve: Curve.fastOutSlowIn,
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          enlargeCenterPage: true,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
          items: snapshot.data.results.map(
            (item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 1.25,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: buildShowcaseItemView(item),
                  );
                },
              );
            },
          ).toList(),
        ),
        _buildMovieShowcaseDetails(),
      ],
    );
  }

  Widget _buildMovieShowcaseDetails() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Lorem ipsum',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Row(
            children: <Widget>[
              FlatButton.icon(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.timer,
                  color: Colors.white,
                  size: 16,
                ),
                color: Colors.transparent,
                label: Text(
                  'Watch Later',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                onPressed: () {},
              ),
              FlatButton.icon(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 16,
                ),
                color: Colors.transparent,
                label: Text(
                  'Info',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
