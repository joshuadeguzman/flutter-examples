// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'package:flutter_moviehub/model/models.dart';
import 'package:flutter_moviehub/resources/api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<MovieList> getPopularMovies() => apiProvider.getPopularMovies();
}
