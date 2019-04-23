// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/blocs/movie_list_bloc.dart';
import 'package:flutter_moviehub/constants/moviedb.dart';
import 'package:flutter_moviehub/model/models.dart';
import 'package:flutter_moviehub/widgets/items/movie_item_shimmer_view.dart';
import 'package:flutter_moviehub/widgets/items/movie_item_view.dart';
import 'package:flutter_moviehub/widgets/list/base_list_view.dart';

class MovieListView extends StatefulWidget {
  String type;

  MovieListView({Key key, this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MovieListViewState();
  }
}

class MovieListViewState extends BaseListView<MovieListView, MovieList> {
  @override
  void initState() {
    super.initState();
    // Retrieve movies based on the requested type
    _getMovies(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // Retrieve streams based on the requested movie type
      stream: _getMovieStream(widget.type),
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
        return buildShimmerListView();
      },
    );
  }

  @override
  Widget buildListView(
    AsyncSnapshot<MovieList> snapshot,
    BuildContext context,
  ) {
    var rootWidth = MediaQuery.of(context).size.width;
    return Container(
      height: rootWidth / 1.75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.results.length,
        itemBuilder: (BuildContext context, int index) {
          return buildMovieItemView(context, snapshot.data.results[index]);
        },
      ),
    );
  }

  @override
  Widget buildShimmerListView() {
    var rootWidth = MediaQuery.of(context).size.width;
    return Container(
      height: rootWidth / 1.75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return buildMovieShimmerItemView();
        },
      ),
    );
  }

  _getMovies(String type) async {
    if (type == MovieType.UPCOMING) {
      movieListBloc.getUpcomingMovies();
    } else if (type == MovieType.TOP_RATED) {
      movieListBloc.getTopRatedMovies();
    } else {
      movieListBloc.getPopularMovies();
    }
  }

  _getMovieStream(String type) {
    if (type == MovieType.UPCOMING) {
      return movieListBloc.upcomingMoviesList;
    } else if (type == MovieType.TOP_RATED) {
      return movieListBloc.topRatedMoviesList;
    } else {
      return movieListBloc.popularMoviesList;
    }
  }
}
