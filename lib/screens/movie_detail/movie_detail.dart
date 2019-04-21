// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/constants/fonts.dart';
import 'package:flutter_moviehub/model/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  Movie movie;

  MovieDetailScreen({Key key, this.movie}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailScreenState();
  }
}

class MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/moviehub.png',
          height: 30,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
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
      ),
      backgroundColor: Colors.black,
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildBannerView(
                context,
                'https://image.tmdb.org/t/p/w500${widget.movie.backdropPath}',
              ),
              _buildMovieDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBannerView(
    BuildContext context,
    String url,
  ) {
    var width = MediaQuery.of(context).size.width;
    var containerHeight = width / 1.5;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  // https://stackoverflow.com/questions/50713888/how-can-i-show-image-from-network-in-flutter-boxdecoration/50714191
                  image: NetworkImage(url)),
            ),
            height: containerHeight,
          ),
          Container(
            height: containerHeight,
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
            height: containerHeight,
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
            height: containerHeight,
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
            height: containerHeight,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    widget.movie.title,
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
                        Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 13,
                        ),
                        Padding(padding: EdgeInsets.only(left: 2)),
                        Text(
                          widget.movie.getYear(),
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
                          widget.movie.getRuntime(),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieDescription() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.movie.overview,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
