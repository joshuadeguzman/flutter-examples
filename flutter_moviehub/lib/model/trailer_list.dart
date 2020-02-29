// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_moviehub/model/trailer.dart';

import 'base_model.dart';

class TrailerList extends BaseModel {
  int id;
  List<Trailer> results = [];

  TrailerList(Map<String, dynamic> data) {
    this.id = data['id'];
    for (int i = 0; i < data['results'].length; i++) {
      this.results.add(Trailer(data['results'][i]));
    }
  }
}