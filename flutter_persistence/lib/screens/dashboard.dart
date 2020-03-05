// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_persistence_demo/widgets/secured_storage_view.dart';
import 'package:flutter_persistence_demo/widgets/shared_preference_view.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Persistence Demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SharedPreferenceView(),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              SecuredStorageView(),
            ],
          ),
        ),
      ),
    );
  }
}
