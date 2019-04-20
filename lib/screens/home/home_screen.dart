// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/widgets/list/movie_list_view.dart';
import 'package:flutter_moviehub/widgets/views/section_header_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter MovieHub Demo'),
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildPopularListView(),
            ],
          ),
        ),
      ),
    );
  }

  _buildPopularListView() {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('Popular'),
          MovieListView(),
        ],
      ),
    );
  }
}
