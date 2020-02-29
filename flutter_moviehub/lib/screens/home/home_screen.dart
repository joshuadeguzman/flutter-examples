// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/blocs/home_bloc.dart';
import 'package:flutter_moviehub/model/movie_list.dart';
import 'package:flutter_moviehub/widgets/list/movie_list_view.dart';
import 'package:flutter_moviehub/widgets/list/showcase_list_view.dart';
import 'package:flutter_moviehub/widgets/views/section_header_view.dart';
import 'package:flutter_moviehub/widgets/views/showcase_banner_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc();
    bloc.getUpcomingMovies();
    bloc.getTopRatedMovies();
    bloc.getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Image.asset(
        'images/moviehub.png',
        height: 30,
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
      leading: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody() {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildShowcaseBannerView(context),
            _buildPopularListView(),
            _buildTopRatedListView(),
          ],
        ),
      ),
    );
  }

  Widget _buildShowcaseBannerView(BuildContext context) {
    //TODO: Replace with dynamic showcase image
    const CAPTAIN_MARVEL_IMAGE_URL =
        'https://static1.squarespace.com/static/588a4776f5e23132a09d23b2/588a4e91be65945e50a36c0e/5c81ebc0a4222f9eb9d52d02/1552056644803/Poster.jpg?format=2500w';
    return Container(
      child: buildShowcaseBannerView(
        context,
        CAPTAIN_MARVEL_IMAGE_URL,
        _buildShowcaseListView(),
      ),
    );
  }

  Widget _buildShowcaseListView() {
    return Container(
      child: Column(
        children: <Widget>[
          StreamBuilder(
            stream: bloc.popularMoviesList,
            builder: (context, AsyncSnapshot<MovieList> snapshot) {
              return ShowcaseListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPopularListView() {
    return Container(
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('Popular'),
          StreamBuilder(
            stream: bloc.popularMoviesList,
            builder: (context, AsyncSnapshot<MovieList> snapshot) {
              return MovieListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTopRatedListView() {
    return Container(
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('Top Rated'),
          StreamBuilder(
            stream: bloc.topRatedMoviesList,
            builder: (context, AsyncSnapshot<MovieList> snapshot) {
              return MovieListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }
}
