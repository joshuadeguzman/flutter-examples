// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_firestore_crud/screens/dashboard/dashboard.dart';
import 'package:flutter_firestore_crud/screens/event_detail/event_detail.dart';
import 'package:flutter_firestore_crud/screens/event_form/event_form.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case DashboardScreen.routeName:
        return MaterialPageRoute(
          // https://github.com/flutter/flutter/issues/16602
          settings: RouteSettings(name: DashboardScreen.routeName),
          builder: (_) => DashboardScreen(),
        );
        break;
      case EventDetailScreen.routeName:
        if (args is EventDetailScreenArgs) {
          return MaterialPageRoute(
            settings: RouteSettings(name: EventDetailScreen.routeName),
            builder: (_) => EventDetailScreen(args: args),
          );
        } else {
          return _showErrorRoute();
        }
        break;
      case EventFormScreen.routeName:
        if (args is EventFormScreenArgs) {
          return MaterialPageRoute(
            settings: RouteSettings(name: EventFormScreen.routeName),
            builder: (_) => EventFormScreen(args: args),
          );
        } else {
          return _showErrorRoute();
        }
        break;
      default:
        return _showErrorRoute();
    }
  }

  static Route<dynamic> _showErrorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Oops.'),
        ),
        body: Center(
          child: Text('We\'re working on this page right now!'),
        ),
      );
    });
  }
}
