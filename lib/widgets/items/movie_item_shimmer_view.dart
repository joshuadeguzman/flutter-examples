// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildMovieShimmerItemView() {
  return SizedBox(
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Card(
        margin: EdgeInsets.only(
          bottom: 30,
          left: 10,
        ),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SizedBox(width: 125),
      ),
    ),
  );
}
