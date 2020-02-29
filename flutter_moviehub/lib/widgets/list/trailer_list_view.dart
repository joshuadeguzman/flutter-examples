// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/model/trailer_list.dart';
import 'package:flutter_moviehub/widgets/items/trailer_item_view.dart';

class TrailerListView extends StatelessWidget {
  final AsyncSnapshot<TrailerList> listItems;

  const TrailerListView({Key key, this.listItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Populate list view with the data
    if (listItems.hasData) {
      return _buildListView(context, listItems.data);
    }
    // Display loading indicator
    else if (listItems.hasError) {
      return Center(child: Text(listItems.error.toString()));
    }
    // Display shimmer loading view
    return _buildShimmerView(context);
  }

  Widget _buildListView(BuildContext context, TrailerList trailers) {
    return ListView.builder(
      itemCount: trailers.results.length,
      itemBuilder: (BuildContext context, int index) {
        return buildTrailerItemView(context, trailers.results[index]);
      },
    );
  }

  Widget _buildShimmerView(BuildContext context) {
    // TODO: Only a stub, update to shimmer view
    return Center(child: CircularProgressIndicator());
  }
}
