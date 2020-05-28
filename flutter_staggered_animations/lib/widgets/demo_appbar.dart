// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/common/constants/app_colors.dart';

Widget getDemoAppBar(BuildContext context, String title) {
  return AppBar(
    iconTheme: IconThemeData(color: AppColors.accent),
    title: Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline
            .copyWith(fontWeight: FontWeight.bold),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
