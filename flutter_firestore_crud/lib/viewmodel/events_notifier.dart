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

  // TODO: Add implementation here
}