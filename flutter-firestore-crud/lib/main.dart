// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_firestore_crud/routes/router.dart';
import 'package:flutter_firestore_crud/screens/dashboard/dashboard.dart';
import 'package:flutter_firestore_crud/services/events_api.dart';
import 'package:flutter_firestore_crud/viewmodel/events_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  EventsApi _eventsApi = EventsApi();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventsNotifer(_eventsApi)),
      ],
      child: MaterialApp(
        title: 'Flutter Events App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            body1: TextStyle(fontSize: 14),
            body2: TextStyle(fontSize: 10),
          ),
        ),
        onGenerateRoute: Router.generateRoute,
        initialRoute: DashboardScreen.routeName,
      ),
    );
  }
}
