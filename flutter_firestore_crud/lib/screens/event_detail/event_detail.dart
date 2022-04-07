// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_firestore_crud/models/event.dart';
import 'package:flutter_firestore_crud/resources/event_type.dart';
import 'package:flutter_firestore_crud/screens/dashboard/dashboard.dart';
import 'package:flutter_firestore_crud/screens/event_form/event_form.dart';
import 'package:flutter_firestore_crud/utils/helpers/firestore_helper.dart';
import 'package:flutter_firestore_crud/viewmodel/events_notifier.dart';
import 'package:flutter_firestore_crud/widgets/event_type_image_view.dart';
import 'package:provider/provider.dart';

class EventDetailScreenArgs {
  final Event event;

  EventDetailScreenArgs(
    this.event,
  );
}

class EventDetailScreen extends StatefulWidget {
  static const String routeName = "/event-detail";
  final EventDetailScreenArgs args;

  const EventDetailScreen({
    Key key,
    @required this.args,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EventDetailScreenState();
  }
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  EventDetailScreenArgs get _args => widget.args;
  EventsNotifer _eventsNotifer;

  @override
  Widget build(BuildContext context) {
    _eventsNotifer = Provider.of<EventsNotifer>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            _args.event.title,
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    EventTypeImageView(
                      height: 200,
                      width: 300,
                      type: EnumToString.fromString(
                        EventType.values,
                        _args.event.eventType,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Event",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    Text(
                      _args.event.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        "Type",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    Text(
                      _args.event.eventType.replaceAll("_", " "),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        "Description",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    Text(
                      _args.event.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        "Date",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    Text(
                      FirestoreHelper.getReadableTime(_args.event.timestamp),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        persistentFooterButtons: <Widget>[
          TextButton(
            onPressed: () {
              _showDeleteDialog();
            },
            child: Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              _showEditPage(_args.event);
            },
            child: Text("Edit"),
          ),
        ],
      ),
    );
  }

  void _showEditPage(Event event) {
    Navigator.pushNamed(
      context,
      EventFormScreen.routeName,
      arguments: EventFormScreenArgs(
        eventFormState: EventFormState.EDIT,
        event: event,
      ),
    );
  }

  void _showDeleteDialog() {
    setState(() {
      showPlatformDialog(
        context: context,
        builder: (_) => BasicDialogAlert(
          title: Text("Confirm deletion"),
          content: Text(
            "This will delete the event \"${_args.event.title}\".\n\nPress \"Confirm\" to continue.",
          ),
          actions: <Widget>[
            BasicDialogAction(
              title: Text(
                "Cancel",
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            BasicDialogAction(
              title: Text(
                "Confirm",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context);
                _confirmEventDeletion();
              },
            ),
          ],
        ),
      );
    });
  }

  void _confirmEventDeletion() async {
    await _eventsNotifer.deleteEvent(_args.event);

    setState(() {
      showPlatformDialog(
        context: context,
        builder: (_) => BasicDialogAlert(
          title: Text("Success"),
          content: Text(
            "The event \"${_args.event.title}\" was successfully removed from your events dashboard.",
          ),
          actions: <Widget>[
            BasicDialogAction(
              title: Text(
                "Close",
              ),
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(DashboardScreen.routeName),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
