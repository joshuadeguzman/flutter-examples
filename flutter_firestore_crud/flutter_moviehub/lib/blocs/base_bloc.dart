// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_moviehub/resources/repository.dart';

abstract class BaseBloc {
  final repository = Repository();
  void dispose() {}
}
