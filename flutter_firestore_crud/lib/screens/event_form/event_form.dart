// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_firestore_crud/models/event.dart';
import 'package:flutter_firestore_crud/resources/event_type.dart';
import 'package:flutter_firestore_crud/screens/dashboard/dashboard.dart';
import 'package:flutter_firestore_crud/viewmodel/events_notifier.dart';
import 'package:flutter_firestore_crud/widgets/event_type_image_view.dart';
import 'package:provider/provider.dart';

enum EventFormState {
  ADD,
  EDIT,
}

class EventFormScreenArgs {
  final EventFormState eventFormState;
  final Event event;

  EventFormScreenArgs({
    @required this.eventFormState,
    this.event,
  });
}

class EventFormScreen extends StatefulWidget {
  static const String routeName = "/event-form";

  final EventFormScreenArgs args;

  const EventFormScreen({
    Key key,
    @required this.args,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EventFormScreenState();
  }
}

class _EventFormScreenState extends State<EventFormScreen> {
  EventsNotifer _eventsNotifer;

  final GlobalKey<FormState> _eventFormKey = GlobalKey<FormState>();
  final TextEditingController _titleTextEditingController =
      TextEditingController();
  final TextEditingController _descriptionTextEditingController =
      TextEditingController();

  EventFormScreenArgs get _args => widget.args;
  EventType _eventType = EventType.meetup;
  bool _hasEditingStarted = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      _eventType = _getEventType();

      if (_args != null && _args.event != null) {
        _titleTextEditingController.text = _args.event.title;
        _descriptionTextEditingController.text = _args.event.description;
      }
    });
  }

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
            },
          ),
          title: Text(
            _getEventTitle(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _eventFormKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      EventTypeImageView(
                        height: 200,
                        width: 350,
                        type: _eventType,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Event Type",
                          style: Theme.of(context).textTheme.title,
                        ),
                        DropdownButton<String>(
                          hint: Text(_getEventTypeStr()),
                          items: <String>[
                            EnumToString.parse(EventType.meetup),
                            EnumToString.parse(EventType.study_jam),
                            EnumToString.parse(EventType.conference),
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _hasEditingStarted = true;
                              _eventType = EnumToString.fromString(
                                EventType.values,
                                value,
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Event Title",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _titleTextEditingController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            hintText: 'eg. Flutter Study Jam #3: Dart Vader',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Event Description",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _descriptionTextEditingController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            hintText: 'Event description',
                          ),
                          minLines: 5,
                          maxLines: 10,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        persistentFooterButtons: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          FlatButton(
            onPressed: () {
              _submitForm();
            },
            child: Text(
              _getButtonTitle(),
            ),
          ),
        ],
      ),
    );
  }

  String _getEventTitle() {
    switch (_args.eventFormState) {
      case EventFormState.EDIT:
        return "Edit event";
        break;
      default:
        return "Add new event";
    }
  }

  String _getEventTypeStr() {
    switch (_args.eventFormState) {
      case EventFormState.EDIT:
        if (_args.event != null && _hasEditingStarted == false) {
          return _args.event.eventType;
        } else {
          return EnumToString.parse(_eventType) ?? "";
        }
        break;
      default:
        return EnumToString.parse(_eventType) ?? "";
    }
  }

  EventType _getEventType() {
    switch (_args.eventFormState) {
      case EventFormState.EDIT:
        if (_args.event != null) {
          return EnumToString.fromString(
            EventType.values,
            _args.event.eventType,
          );
        } else {
          return EventType.meetup;
        }
        break;
      default:
        return EventType.meetup;
    }
  }

  String _getButtonTitle() {
    switch (_args.eventFormState) {
      case EventFormState.EDIT:
        return "Update";
        break;
      default:
        return "Submit New Event";
    }
  }

  void _submitForm() {
    // TODO: Add implementation here
  }

  void _showSubmitDialog() {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text("Success"),
        content: Text(_getSuccessMessage()),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("Cancel"),
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
  }

  String _getSuccessMessage() {
    switch (_args.eventFormState) {
      case EventFormState.EDIT:
        return "Event successfully updated!";
        break;
      default:
        return "Event successfully submitted!";
    }
  }
}
