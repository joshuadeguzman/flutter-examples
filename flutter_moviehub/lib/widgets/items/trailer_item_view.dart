// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/constants/fonts.dart';
import 'package:flutter_moviehub/model/trailer.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildTrailerItemView(BuildContext context, Trailer trailer) {
  var width = MediaQuery.of(context).size.width;
  var height = width / 2;
  return InkWell(
    child: Card(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        color: Colors.black,
        height: height,
        child: Stack(
          children: <Widget>[
            _buildThumbnailView(trailer.key),
            _buildBackdropBottomGradientOverlayView(),
            _buildDetailView(trailer),
            _buildPlayButtonView(trailer.key),
          ],
        ),
      ),
    ),
    onTap: () => {},
  );
}

Widget _buildThumbnailView(String videoKey) {
  return Container(
    height: double.maxFinite,
    width: double.infinity,
    child: Image.network(
      // Youtube Full Thumbnail
      // https://stackoverflow.com/questions/2068344/how-do-i-get-a-youtube-video-thumbnail-from-the-youtube-api
      'https://img.youtube.com/vi/$videoKey/0.jpg',
      fit: BoxFit.cover,
      scale: 2,
    ),
  );
}

Widget _buildBackdropBottomGradientOverlayView() {
  return Container(
    height: double.maxFinite,
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

Widget _buildPlayButtonView(String videoKey) {
  return Container(
    child: Center(
      child: FloatingActionButton(
        onPressed: () async {
          // https://groups.google.com/forum/#!topic/flutter-dev/J3ujgdOuG98
          var url = 'https://www.youtube.com/watch?v=$videoKey';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 40,
        ),
      ),
    ),
  );
}

Widget _buildDetailView(Trailer trailer) {
  return Container(
      height: double.maxFinite,
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            trailer.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: Fonts.OPEN_SANS,
              fontSize: 13.0,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 13,
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      trailer.type,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: Fonts.OPEN_SANS,
                        fontSize: 12.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Icon(
                      Icons.movie,
                      color: Colors.white,
                      size: 14,
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      "Youtube",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: Fonts.OPEN_SANS,
                        fontSize: 12.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Icon(
                      Icons.hd,
                      color: Colors.white,
                      size: 14,
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      trailer.size.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: Fonts.OPEN_SANS,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ));
}
