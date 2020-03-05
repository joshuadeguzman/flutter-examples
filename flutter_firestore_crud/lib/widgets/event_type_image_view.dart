// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_firestore_crud/resources/event_type.dart';
import 'package:undraw/illustrations.dart';
import 'package:undraw/undraw.dart';

class EventTypeImageView extends StatelessWidget {
  final double height;
  final double width;
  final EventType type;

  const EventTypeImageView({
    Key key,
    @required this.height,
    @required this.width,
    @required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: UnDraw(
          color: Colors.blue,
          illustration: _getIllustration(type),
          placeholder: Container(),
          errorWidget: Icon(Icons.error_outline, color: Colors.red, size: 50)),
    );
  }

  UnDrawIllustration _getIllustration(EventType type) {
    switch (type) {
      case EventType.meetup:
        return UnDrawIllustration.community;
        break;
      case EventType.study_jam:
        return UnDrawIllustration.studying;
        break;
      case EventType.conference:
        return UnDrawIllustration.conference_speaker;
        break;
      default:
        return UnDrawIllustration.not_found;
    }
  }
}
