// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_moviehub/blocs/base_bloc.dart';
import 'package:flutter_moviehub/model/models.dart';
import 'package:rxdart/rxdart.dart';

class MovieListBloc extends BaseBloc<MovieList> {
  Observable<MovieList> popularMoviesList() => fetcher.stream;

  getPopularMovies() async {
    MovieList movieList = await repository.getPopularMovies();
    fetcher.sink.add(movieList);
  }
}

final movieListBloc = MovieListBloc();
