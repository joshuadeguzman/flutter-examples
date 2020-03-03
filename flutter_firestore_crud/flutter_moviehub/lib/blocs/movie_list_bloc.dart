// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_moviehub/blocs/base_bloc.dart';
import 'package:flutter_moviehub/model/models.dart';
import 'package:rxdart/rxdart.dart';

class MovieListBloc extends BaseBloc {
  final upcomingFetcher = PublishSubject<MovieList>();
  final popularFetcher = PublishSubject<MovieList>();
  final topRatedFetcher = PublishSubject<MovieList>();

  Observable<MovieList> get upcomingMoviesList => upcomingFetcher.stream;
  Observable<MovieList> get popularMoviesList => popularFetcher.stream;
  Observable<MovieList> get topRatedMoviesList => topRatedFetcher.stream;

  @override
  void dispose() {
    super.dispose();
    upcomingFetcher.close();
    popularFetcher.close();
    topRatedFetcher.close();
  }

  void getUpcomingMovies() async {
    MovieList movieList = await repository.getUpcomingMovies();
    upcomingFetcher.sink.add(movieList);
  }

  void getPopularMovies() async {
    MovieList movieList = await repository.getPopularMovies();
    popularFetcher.sink.add(movieList);
  }

  void getTopRatedMovies() async {
    MovieList movieList = await repository.getTopRatedMovies();
    topRatedFetcher.sink.add(movieList);
  }
}

final movieListBloc = MovieListBloc();
