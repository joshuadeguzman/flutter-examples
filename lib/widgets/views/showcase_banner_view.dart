// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

Widget buildShowcaseBannerView(
    BuildContext context, String url, Widget showcaseWidget) {
  var rootWidth = MediaQuery.of(context).size.width;
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
          height: rootWidth / 1.25,
        ),
        Container(
          height: rootWidth / 1.25,
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
          height: rootWidth / 1.25,
          // https://stackoverflow.com/questions/51545768/flutter-vertically-center-column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[showcaseWidget],
          ),
        )
      ],
    ),
  );
}
