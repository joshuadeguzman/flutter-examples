// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_crud/models/event.dart';
import 'package:flutter_firestore_crud/services/events_api.dart';

class EventsNotifer extends ChangeNotifier {
  EventsApi _api;
  List<Event> _events;

  EventsNotifer(EventsApi api) {
    _api = api;
  }

  Future<List<Event>> getEvents() async {
    QuerySnapshot result = await _api.getCollection();
    _events = result.documents
        .map((document) => Event.fromMap(document.data, document.documentID))
        .toList();
    return _events;
  }

  Future<Event> createNewEvent(Event event) async {
    Map data = event.toJson();
    DocumentReference document = await _api.addDocument(data);
    return Event.fromMap(data, document.documentID);
  }

  Future<Event> updateEventDetails(Event event) async {
    Map data = event.toJson();
    DocumentReference document = await _api.updateDocument(event.id, data);
    return Event.fromMap(data, document.documentID);
  }

  Future<Event> deleteEvent(Event event) async {
    Map data = event.toJson();
    await _api.deleteDocument(event.id);
    return Event.fromMap(data, event.id);
  }

  Stream<QuerySnapshot> streamEvents() {
    return _api.streamCollection();
  }
}
