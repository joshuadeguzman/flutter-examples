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
  int _current = 0;

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
    // https://pub.dartlang.org/packages/carousel_slider
    return CarouselSlider(
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
    );
  }
}
