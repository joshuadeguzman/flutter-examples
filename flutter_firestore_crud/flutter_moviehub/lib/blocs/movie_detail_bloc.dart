// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_moviehub/blocs/base_bloc.dart';
import 'package:flutter_moviehub/model/models.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc extends BaseBloc {
  final _fetchMovie = PublishSubject<Movie>();
  Observable<Movie> get movieDetailStream => _fetchMovie.stream;

  @override
  void dispose() async {
    await _fetchMovie.drain();
    _fetchMovie.close();
    super.dispose();
  }
  void getMovie(int movieId) async {
    Movie movie = await repository.getMovie(movieId);
    _fetchMovie.sink.add(movie);
  }
}
