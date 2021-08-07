// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String imagePath;

  const AppNetworkImage({
    Key? key,
    /*required*/ required this.imagePath,
  })  : assert(imagePath != null, 'Image source must not be null!'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Image.network(imagePath);
    } else {
      return CachedNetworkImage(imageUrl: imagePath);
    }
  }
}
