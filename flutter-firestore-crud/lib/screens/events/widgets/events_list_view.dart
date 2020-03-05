// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_crud/models/event.dart';
import 'package:flutter_firestore_crud/resources/event_type.dart';
import 'package:flutter_firestore_crud/screens/event_detail/event_detail.dart';
import 'package:flutter_firestore_crud/utils/common/on_click_callback.dart';
import 'package:flutter_firestore_crud/viewmodel/events_notifier.dart';
import 'package:flutter_firestore_crud/widgets/event_type_image_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firestore_crud/utils/extensions/string_extensions.dart';

class EventsListView extends StatefulWidget {
  final OnClickCallback<Event> onRsvpClicked;

  const EventsListView({
    Key key,
    this.onRsvpClicked,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EventsListViewState();
  }
}

class _EventsListViewState extends State<EventsListView> {
  EventsNotifer _eventsNotifer;
  List<Event> _events = [];
  OnClickCallback<Event> get _onRsvpClicked => widget.onRsvpClicked;

  @override
  Widget build(BuildContext context) {
    _eventsNotifer = Provider.of<EventsNotifer>(context);
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      child: StreamBuilder(
        stream: _eventsNotifer.streamEvents(),
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasData && snapshot.data.documents.length > 0) {
            _events = snapshot.data.documents
                .map((item) => Event.fromMap(item.data, item.documentID))
                .toList();
            return ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, position) {
                return _EventsListItemView(
                  event: _events[position],
                  onRsvpClick: _onRsvpClicked,
                );
              },
            );
          } else {
            return Center(
              child: Text("No events found."),
            );
          }
        },
      ),
    );
  }
}

class _EventsListItemView extends StatelessWidget {
  final Event event;
  final OnClickCallback<Event> onRsvpClick;

  const _EventsListItemView({
    Key key,
    @required this.event,
    this.onRsvpClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          EventDetailScreen.routeName,
          arguments: EventDetailScreenArgs(event),
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            top: 24,
            left: 8,
            right: 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  EventTypeImageView(
                    height: 100,
                    width: 150,
                    type: EnumToString.fromString(
                      EventType.values,
                      event.eventType,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          event.title,
                          style: Theme.of(context).textTheme.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          event.description.substringSafe(0, 100),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.body2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          margin: const EdgeInsets.only(
                            top: 16,
                          ),
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 4,
                            bottom: 4,
                          ),
                          child: Text(
                            event.eventType.replaceAll("_", " "),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.body2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.favorite_border),
                        SizedBox(width: 8),
                        Text('Add to Favorites')
                      ],
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('RSVP'),
                    onPressed: () {
                      if (onRsvpClick != null) {
                        onRsvpClick(event);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
