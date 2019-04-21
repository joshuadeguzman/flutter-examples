// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/widgets/views/banner_view.dart';

class MovieDetailScreen extends StatefulWidget {
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
            children: <Widget>[
              buildBannerView(
                context,
                'https://static1.squarespace.com/static/588a4776f5e23132a09d23b2/588a4e91be65945e50a36c0e/5c81ebc0a4222f9eb9d52d02/1552056644803/Poster.jpg?format=2500w',
              ),
              // TODO: Add more details to the movie
            ],
          ),
        ),
      ),
    );
  }
}
