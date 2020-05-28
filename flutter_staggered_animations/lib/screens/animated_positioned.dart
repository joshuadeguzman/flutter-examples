// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/common/constants/app_colors.dart';
import 'package:flutter_staggered_animations/widgets/app_button.dart';
import 'package:flutter_staggered_animations/widgets/demo_appbar.dart';

class DemoAnimatedPositionedPage extends StatefulWidget {
  static const routeName = '/demo-animated-positioned-page';

  @override
  State<StatefulWidget> createState() {
    return _DemoAnimatedPositionedPageState();
  }
}

class _DemoAnimatedPositionedPageState extends State {
  final Random random = Random();
  double kBoxHeight = 200;
  double kBoxWidth = 200;
  double top = 200;
  double left = 200;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getDemoAppBar(
        context,
        'AnimatedPositioned',
      ),
      backgroundColor: AppColors.primaryAccent,
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 64,
          left: 16,
          right: 16,
        ),
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              AnimatedPositioned(
                top: top,
                left: left,
                curve: Curves.easeInCubic,
                duration: Duration(milliseconds: 500),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: kBoxHeight,
                  width: kBoxWidth,
                  color: AppColors.accent,
                  child: Center(
                    child: Text(
                      'AnimatedPositioned',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryAccent,
                          ),
                    ),
                  ),
                ),
              ),
              AppButton(
                iconData: Icons.repeat,
                title: 'Randomize',
                onPressed: () {
                  final t = random.nextInt(400) + 0.0;
                  final l = random.nextInt(200) + 0.0;
                  setState(() {
                    top = t;
                    left = l;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
