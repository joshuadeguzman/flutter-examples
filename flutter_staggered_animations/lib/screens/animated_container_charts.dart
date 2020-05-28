// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/common/constants/app_colors.dart';
import 'package:flutter_staggered_animations/widgets/app_button.dart';
import 'package:flutter_staggered_animations/widgets/demo_appbar.dart';

class DemoAnimatedContainerChartsPage extends StatefulWidget {
  static const routeName = '/demo-animated-container-charts-page';

  @override
  State<StatefulWidget> createState() {
    return _DemoAnimatedContainerChartsPageState();
  }
}

class _DemoAnimatedContainerChartsPageState extends State {
  final Random random = Random();
  double cHeight1 = 200;
  double cHeight2 = 120;
  double cHeight3 = 125;
  double cWidth1 = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDemoAppBar(
        context,
        'Bar Charts Example',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 32),
                    AnimatedContainer(
                      color: AppColors.accent,
                      height: cHeight1,
                      width: cWidth1,
                      duration: Duration(milliseconds: 1500),
                      child: Center(
                        child: Text(
                          cHeight1.toInt().toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryAccent,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    AnimatedContainer(
                      color: AppColors.accent,
                      height: cHeight2,
                      width: cWidth1,
                      duration: Duration(milliseconds: 1500),
                      child: Center(
                        child: Text(
                          cHeight2.toInt().toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryAccent,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    AnimatedContainer(
                      color: AppColors.accent,
                      height: cHeight3,
                      width: cWidth1,
                      duration: Duration(milliseconds: 1500),
                      child: Center(
                        child: Text(
                          cHeight3.toInt().toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryAccent,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AppButton(
              iconData: Icons.repeat,
              title: 'Randomize',
              onPressed: () {
                final h1 = random.nextInt(300) + 50.0;
                final h2 = random.nextInt(300) + 50.0;
                final h3 = random.nextInt(300) + 50.0;
                setState(() {
                  cHeight1 = h1;
                  cHeight2 = h2;
                  cHeight3 = h3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
