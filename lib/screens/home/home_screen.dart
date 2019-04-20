// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/widgets/list/movie_list_view.dart';
import 'package:flutter_moviehub/widgets/views/section_header_view.dart';
import 'package:flutter_moviehub/widgets/views/showcase_banner_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter MovieHub Demo'),
      ),
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildShowcaseBannerView(context),
              _buildPopularListView(),
              _buildPopularListView(), // TODO: Remove this
            ],
          ),
        ),
      ),
    );
  }

  _buildShowcaseBannerView(BuildContext context) {
    return Container(
      child: buildShowcaseBannerView(
          context,
          '',
          _buildPopularListView()),
    );
  }

  _buildPopularListView() {
    return Container(
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('POPULAR'),
          MovieListView(),
        ],
      ),
    );
  }
}
