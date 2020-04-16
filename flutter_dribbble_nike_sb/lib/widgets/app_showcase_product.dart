// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_dribbble_nike_sb/common/constants/constants.dart';
import 'package:flutter_dribbble_nike_sb/widgets/app_network_image.dart';

class AppShowCaseProduct extends StatelessWidget {
  final double productSize;

  const AppShowCaseProduct({
    Key key,
    @required this.productSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: productSize * 10,
      curve: Curves.fastLinearToSlowEaseIn,
      child: AppNetworkImage(
        imagePath: AssetConstants.nikeSb1,
      ),
    );
  }
}
