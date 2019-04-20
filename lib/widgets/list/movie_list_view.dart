// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/blocs/movie_list_bloc.dart';
import 'package:flutter_moviehub/model/models.dart';
import 'package:flutter_moviehub/widgets/items/popular_item_view.dart';
import 'package:flutter_moviehub/widgets/list/base_list_view.dart';

class MovieListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListViewState();
  }
}

class MovieListViewState extends BaseListView<MovieListView, MovieList> {
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
    var rootWidth = MediaQuery.of(context).size.width; 
    return Container(
      height: rootWidth / 1.75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.results.length,
        itemBuilder: (BuildContext context, int index) {
          return buildPopularItemView(snapshot.data.results[index]);
        },
      ),
    );
  }
}
