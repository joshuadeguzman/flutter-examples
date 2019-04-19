// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

abstract class BaseListView<T extends StatefulWidget, M> extends State<T> {
  Widget buildListView(
    AsyncSnapshot<M> snapshot,
    BuildContext context,
  );
}
