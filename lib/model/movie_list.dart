// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'models.dart';

class MovieList extends BaseModel {
  int page;
  int totalResults;
  int totalPages;
  List<Movie> results;

  MovieList(Map<String, dynamic> data) {
    this.page = data['page'];
    this.totalResults = data['total_results'];
    this.totalPages = data['total_pages'];
    this.results = data['results'];
  }
}
