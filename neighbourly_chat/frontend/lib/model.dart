// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// This can be generate using https://javiercbk.github.io/json_to_dart/
// Example response
// {
//   "uuid": "some-uuid",
//   "message": "some message"
// }
//
class Message {
  String uuid;
  String message;

  Message({this.uuid, this.message});

  Message.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['message'] = this.message;
    return data;
  }
}
