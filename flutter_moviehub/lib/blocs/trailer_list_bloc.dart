// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_moviehub/blocs/base_bloc.dart';
import 'package:flutter_moviehub/model/trailer_list.dart';
import 'package:rxdart/rxdart.dart';

class TrailerListBloc extends BaseBloc {
  final _fetchMovieTrailers = PublishSubject<TrailerList>();
  Observable<TrailerList> get movieTrailersStream => _fetchMovieTrailers.stream;

  @override
  void dispose() async {
    await _fetchMovieTrailers.drain();
    _fetchMovieTrailers.close();
    super.dispose();
  }

  void getMovieTrailers(int movieId) async {
    TrailerList trailerList = await repository.getMovieTrailers(movieId);
    _fetchMovieTrailers.sink.add(trailerList);
  }
}