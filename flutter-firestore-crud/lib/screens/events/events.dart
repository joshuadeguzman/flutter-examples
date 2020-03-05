// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_firestore_crud/models/event.dart';
import 'package:flutter_firestore_crud/screens/events/widgets/events_list_view.dart';
import 'package:flutter_firestore_crud/utils/helpers/firestore_helper.dart';

class EventsScreen extends StatefulWidget {
  static const String routeName = "/events";

  @override
  State<StatefulWidget> createState() {
    return _EventScreenState();
  }
}

class _EventScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: EventsListView(onRsvpClicked: (event) => _onRsvpClicked(event)),
    );
  }

  void _onRsvpClicked(Event event) {
    setState(() {
      showPlatformDialog(
        context: context,
        builder: (_) => BasicDialogAlert(
          title: Text("Confirm RSVP"),
          content: Text(
            "Would you like to confirm your RSVP to ${event.title} on ${FirestoreHelper.getReadableTime(event.timestamp)}?",
          ),
          actions: <Widget>[
            BasicDialogAction(
              title: Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            BasicDialogAction(
              title: Text("Confirm"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    });
  }
}
