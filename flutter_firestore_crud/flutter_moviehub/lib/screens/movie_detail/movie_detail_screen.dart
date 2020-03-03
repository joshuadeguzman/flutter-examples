// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/blocs/movie_detail_bloc_provider.dart';
import 'package:flutter_moviehub/blocs/trailer_list_bloc_provider.dart';
import 'package:flutter_moviehub/constants/fonts.dart';
import 'package:flutter_moviehub/model/movie.dart';
import 'package:flutter_moviehub/screens/movie_detail/trailer_list_screen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_moviehub/blocs/movie_detail_bloc.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;

  MovieDetailScreen({Key key, this.movieId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailScreenState();
  }
}

class MovieDetailScreenState extends State<MovieDetailScreen>
    with SingleTickerProviderStateMixin {
  MovieDetailBloc bloc;
  TabController tController;
  double currentPageValue;

  @override
  void initState() {
    tController = TabController(initialIndex: 0, length: 3, vsync: this);
    tController.addListener(() {
      print("Current tab controller page ${tController.index}");
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    bloc = MovieDetailBlocProvider.of(context);
    bloc.getMovie(widget.movieId);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    tController.dispose();
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
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
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: bloc.movieDetailStream,
      builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
        if (snapshot.hasData) {
          return _buildMovieDetailView(context, snapshot.data);
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildMovieDetailView(BuildContext context, Movie movie) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBannerView(context, movie),
            _buildMovieDescription(movie.overview),
            _buildMovieActions(),
            _buildSectionTabView(),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerView(BuildContext context, Movie movie) {
    var width = MediaQuery.of(context).size.width;
    var height = width / 1.5;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                ),
              ),
            ),
            height: height,
          ),
          Container(
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black,
                ],
                stops: [0.0, 1],
              ),
            ),
          ),
          Container(
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black,
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          Container(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            height: height,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                                size: 13,
                              ),
                              Padding(padding: EdgeInsets.only(left: 2)),
                              Text(
                                movie.getYear(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: Fonts.OPEN_SANS,
                                  fontSize: 12.0,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Icon(
                                Icons.timelapse,
                                color: Colors.white,
                                size: 14,
                              ),
                              Text(
                                movie.getRuntime(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: Fonts.OPEN_SANS,
                                  fontSize: 12.0,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Icon(
                                Icons.hd,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              SmoothStarRating(
                                rating: movie.getRating(),
                                allowHalfRating: true,
                                size: 12,
                                starCount: 5,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieDescription(String description) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              fontFamily: Fonts.OPEN_SANS,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieActions() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontFamily: Fonts.OPEN_SANS,
              ),
            ),
            onPressed: () {},
          ),
          FlatButton.icon(
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.list,
              color: Colors.white,
              size: 16,
            ),
            color: Colors.transparent,
            label: Text(
              'My List',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontFamily: Fonts.OPEN_SANS,
              ),
            ),
            onPressed: () {},
          ),
          FlatButton.icon(
            // padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.share,
              color: Colors.white,
              size: 16,
            ),
            color: Colors.transparent,
            label: Text(
              'Share',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontFamily: Fonts.OPEN_SANS,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTabView() {
    return Column(
      children: <Widget>[
        TabBar(
          controller: tController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.info)),
            Tab(icon: Icon(Icons.movie)),
            Tab(icon: Icon(Icons.photo)),
          ],
          indicatorWeight: 5,
        ),
        Container(
          height: 500,
          child: TabBarView(
            controller: tController,
            children: <Widget>[
              TestScreen(),
              TrailerListBlocProvider(
                child: TrailerListScreen(
                  movieId: widget.movieId,
                ),
              ),
              TestScreen(),
            ],
          ),
        ),
      ],
    );
  }
}

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime,
      child: Center(
        child: Text(
          "Test Screen",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
    );
  }
}
