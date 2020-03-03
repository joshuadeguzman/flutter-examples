// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

class Trailer {
  String id;
  String iso_639_1;
  String iso_3166_1;
  String key;
  String name;
  int size;
  String type;

  Trailer(Map<String, dynamic> data) {
    this.id = data['id'];
    this.iso_639_1 = data['iso_639_1'];
    this.iso_3166_1 = data['iso_3166_1'];
    this.key = data['key'];
    this.name = data['name'];
    this.size = data['size'];
    this.type = data['type'];
  }
}