// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_moviehub/blocs/base_bloc.dart';
import 'package:flutter_moviehub/model/movie.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc extends BaseBloc<Movie> {
  final fetcher = PublishSubject<Movie>();
  Observable<Movie> get movieDetailStream => fetcher.stream;

  getMovie(int id) async {
    Movie movie = await repository.getMovie(id);
    fetcher.sink.add(movie);
  }

  @override
  dispose() {
    super.dispose();
    fetcher.close();
  }
}

final movieDetaiBloc = MovieDetailBloc();
