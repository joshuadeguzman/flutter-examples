// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/model/movie.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShowcaseItemShimmerView(Movie movie) {
  return SizedBox(
    child: Shimmer.fromColors(
      baseColor: Colors.grey[400],
      highlightColor: Colors.grey[100],
      child: Card(
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
        child: SizedBox(width: 125),
      ),
    ),
  );
}
