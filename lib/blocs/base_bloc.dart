// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_moviehub/model/models.dart';
import 'package:flutter_moviehub/resources/repository.dart';
import 'package:rxdart/subjects.dart';

abstract class BaseBloc<T extends BaseModel> {
  final repository = Repository();
  final upcomingFetcher = PublishSubject<T>();
  final popularFetcher = PublishSubject<T>();
  final topRatedFetcher = PublishSubject<T>();

  dispose() {
    upcomingFetcher.close();
    popularFetcher.close();
    topRatedFetcher.close();
  }
}
