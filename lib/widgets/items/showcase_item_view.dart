// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/model/movie.dart';

Widget buildShowcaseItemView(Movie movie) {
  return Card(
    margin: EdgeInsets.only(
      bottom: 30,
      left: 10,
    ),
    elevation: 7.5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Image.network(
      // https://developers.themoviedb.org/3/getting-started/images
      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
      fit: BoxFit.cover,
      // width: 300,
    ),
  );
}
