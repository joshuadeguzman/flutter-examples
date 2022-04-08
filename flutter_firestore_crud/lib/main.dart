// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firestore_crud/routes/app_router.dart';
import 'package:flutter_firestore_crud/screens/dashboard/dashboard.dart';
import 'package:flutter_firestore_crud/services/events_api.dart';
import 'package:flutter_firestore_crud/viewmodel/events_notifier.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

bool USE_FIRESTORE_EMULATOR = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: "flutter_firestore_crud", options: DefaultFirebaseOptions.currentPlatform);

  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.settings = const Settings(
        host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final EventsApi _eventsApi = EventsApi();

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
            headline1: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            subtitle1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 14),
            bodyText2: TextStyle(fontSize: 10),
          ),
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: DashboardScreen.routeName,
      ),
    );
  }
}

