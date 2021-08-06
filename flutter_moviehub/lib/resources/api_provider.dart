// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:flutter_moviehub/model/models.dart';

class ApiProvider {
  Client client = Client();
  final apiKey = '973e0b034af17e62d03ca343795ac965';
  final baseUrl = 'https://api.themoviedb.org/3/movie';

  Future<MovieList> getMovies(String type) async {
    var url = Uri.parse('$baseUrl/$type?api_key=$apiKey');
    final response = await client.get(url);
    if (response.statusCode == HttpStatus.ok) {
      print(response.request.url.toString());
      return MovieList(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<Movie> getMovie(int movieId) async {
    var url = Uri.parse('$baseUrl/$movieId?api_key=$apiKey');
    final response = await client.get(url);
    if (response.statusCode == HttpStatus.ok) {
      print(response.request.url.toString());
      return Movie(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie');
    }
  }

  Future<TrailerList> getMovieTrailers(int movieId) async {
    var url = Uri.parse('$baseUrl/$movieId/videos?api_key=$apiKey');
    final response = await client.get(url);
    if(response.statusCode == HttpStatus.ok) {
      print(response.request.url.toString());
      return TrailerList(json.decode(response.body));
    } else {
      throw Exception('Failed to love movie trailers');
    }
  }
}
