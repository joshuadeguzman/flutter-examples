// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SharedPreferenceViewState();
  }
}

class SharedPreferenceViewState extends State<SharedPreferenceView> {
  final String KEY_COUNTER = 'counter';
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    // Update view with the initial value
    _retrievePersistedCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Storing simple data locally using\nshared_preferences ^0.5.2',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
        Text(
          'Wraps NSUserDefaults (on iOS) and SharedPreferences (on Android). Not recommended for storing critical data.',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.blue,
            height: 150,
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'COUNTER',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Text(
                  '$_counter',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Increment'),
                      onPressed: _incrementCounter,
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    RaisedButton(
                      child: Text('Decrement'),
                      onPressed: _decreaseCounter,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _retrievePersistedCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int counter = (preferences.getInt(KEY_COUNTER) ?? 0) + 1;

    setState(() {
      _counter = counter;
    });
  }

  _incrementCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int counter = (preferences.getInt(KEY_COUNTER) ?? 0) + 1;
    await preferences.setInt(KEY_COUNTER, counter);

    setState(() {
      _counter = counter;
    });
  }

  _decreaseCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int counter = (preferences.getInt(KEY_COUNTER) ?? 0) - 1;
    await preferences.setInt(KEY_COUNTER, counter);

    setState(() {
      _counter = counter;
    });
  }
}
