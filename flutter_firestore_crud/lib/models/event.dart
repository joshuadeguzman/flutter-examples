// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String? id;
  String? title;
  String? description;
  String? eventType;
  Timestamp? timestamp;

  Event({
    this.id,
    required this.title,
    required this.description,
    required this.eventType,
    required this.timestamp,
  });

  Event.fromMap(Map snapshot, String? documentId) {
    this.id = documentId;
    this.title = snapshot["title"];
    this.description = snapshot["description"];
    this.timestamp = snapshot["timestamp"];
    this.eventType = snapshot["event_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['timestamp'] = this.timestamp;
    data['event_type'] = this.eventType;
    return data;
  }
}
