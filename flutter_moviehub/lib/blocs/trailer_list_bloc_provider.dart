// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/blocs/trailer_list_bloc.dart';

class TrailerListBlocProvider extends InheritedWidget {
  final TrailerListBloc bloc;

  TrailerListBlocProvider({Key key, Widget child})
      : bloc = TrailerListBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static TrailerListBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<TrailerListBlocProvider>())
        .bloc;
  }
}
