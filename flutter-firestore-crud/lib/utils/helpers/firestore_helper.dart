// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FirestoreHelper {
  static String getReadableTime(Timestamp timestamp) {
    final format = DateFormat.yMMMMd();
    var date = new DateTime.fromMillisecondsSinceEpoch(
      timestamp.millisecondsSinceEpoch,
    );
    return format.format(date);
  }
}
