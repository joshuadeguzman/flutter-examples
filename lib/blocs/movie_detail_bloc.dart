// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_moviehub/model/movie.dart';
import 'package:flutter_moviehub/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc {
  final repository = Repository();
  final fetcher = PublishSubject<Movie>();
  Observable<Movie> get movieDetailStream => fetcher.stream;

  getMovie(int id) async {
    Movie movie = await repository.getMovie(id);
    fetcher.sink.add(movie);
  }

  dispose() {
    fetcher.close();
  }
}

final movieDetaiBloc = MovieDetailBloc();
