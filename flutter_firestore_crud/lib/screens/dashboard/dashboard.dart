// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_firestore_crud/screens/event_form/event_form.dart';
import 'package:flutter_firestore_crud/screens/events/events.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = "/";
  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: Text("#FlutterEverywhere"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        body: Center(
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              EventsScreen(),
              _DemoScreen(),
              _DemoScreen(),
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              child: Icon(Icons.event),
              backgroundColor: Colors.blue,
              label: 'Submit New Event',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  EventFormScreen.routeName,
                  arguments: EventFormScreenArgs(
                    eventFormState: EventFormState.ADD,
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Events",
              icon: Icon(FontAwesomeIcons.calendar),
            ),
            BottomNavigationBarItem(
              label: "Going",
              icon: Icon(FontAwesomeIcons.check),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(FontAwesomeIcons.user),
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Demo Screen"),
    );
  }
}
