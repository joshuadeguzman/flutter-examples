// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

Widget buildBannerView(
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
        )
      ],
    ),
  );
}
