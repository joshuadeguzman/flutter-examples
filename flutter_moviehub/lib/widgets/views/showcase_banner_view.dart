// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

Widget _buildBackdropImageView(double height, url) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      image: DecorationImage(
          fit: BoxFit.cover,
          // https://stackoverflow.com/questions/50713888/how-can-i-show-image-from-network-in-flutter-boxdecoration/50714191
          image: NetworkImage(url)),
    ),
    height: height,
  );
}

Widget _buildBackdropTopGradientOverlayView(double height) {
  return Container(
    height: height,
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
  );
}

Widget _buildBackdropBottomGradientOverlayView(double height) {
  return Container(
    height: height,
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
  );
}

Widget _buildCarouselView(double height, Widget showcaseWidget) {
  return Container(
    height: height,
    // With respect to the appbar gradient effect
    padding: EdgeInsets.only(top: 20),
    child: Column(
      // https://stackoverflow.com/questions/51545768/flutter-vertically-center-column
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[showcaseWidget],
    ),
  );
}

Widget buildShowcaseBannerView(
    BuildContext context, String url, Widget showcaseWidget) {
  var rootWidth = MediaQuery.of(context).size.width;
  var height = rootWidth / 1.15;
  return Container(
    child: Stack(
      children: <Widget>[
        _buildBackdropImageView(height, url),
        _buildBackdropTopGradientOverlayView(height),
        _buildBackdropBottomGradientOverlayView(height),
        _buildCarouselView(height, showcaseWidget),
      ],
    ),
  );
}
