// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/common/constants/app_colors.dart';
import 'package:flutter_staggered_animations/widgets/app_button.dart';
import 'package:flutter_staggered_animations/widgets/demo_appbar.dart';

class DemoAnimatedContainerPage extends StatefulWidget {
  static const routeName = '/demo-animated-container-page';

  @override
  State<StatefulWidget> createState() {
    return _DemoAnimatedContainerPageState();
  }
}

class _DemoAnimatedContainerPageState extends State {
  final Random random = Random();
  double height = 200;
  double width = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDemoAppBar(
        context,
        'AnimatedContainer',
      ),
      backgroundColor: AppColors.primaryAccent,
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 64,
          left: 16,
          right: 16,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 32),
                AnimatedContainer(
                  color: AppColors.accent,
                  height: height,
                  width: width,
                  padding: const EdgeInsets.all(8),
                  duration: Duration(milliseconds: 1500),
                  child: Center(
                    child: Text(
                      'AnimatedContainer',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryAccent,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            AppButton(
              iconData: Icons.repeat,
              title: 'Randomize',
              onPressed: () {
                final h = random.nextInt(300) + 50.0;
                final w = random.nextInt(300) + 50.0;
                setState(() {
                  height = h;
                  width = w;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
