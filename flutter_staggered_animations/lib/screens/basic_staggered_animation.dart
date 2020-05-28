// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/common/constants/app_colors.dart';
import 'package:flutter_staggered_animations/widgets/app_button.dart';
import 'package:flutter_staggered_animations/widgets/demo_appbar.dart';

class DemoBasicStaggeredAnimationPage extends StatefulWidget {
  static const routeName = '/demo-basic-staggered-animation-page';

  @override
  State<StatefulWidget> createState() {
    return _DemoBasicStaggeredAnimationPageState();
  }
}

class _DemoBasicStaggeredAnimationPageState extends State
    with SingleTickerProviderStateMixin {
  bool isPlayed = false;
  AnimationController controller;
  Animation<double> animationSize;
  Animation<double> animatedPosition;
  Animation<Color> animationColor;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animationSize = Tween<double>(begin: 200, end: 50).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.25,
          curve: Curves.ease,
        ),
      ),
    );
    // animatedPosition = Tween<double>(begin: 0, end: 300).animate(
    //   CurvedAnimation(
    //     parent: controller,
    //     curve: Interval(
    //       0.5, // 1
    //       1,
    //       curve: Curves.bounceInOut,
    //     ),
    //   ),
    // );
    // JDG-DEMO: Tween Sequence
    animatedPosition = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 100, end: 0),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 300),
          weight: 50.0,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.25, // 1
          0.75,
          curve: Curves.ease,
        ),
      ),
    );
    animationColor =
        ColorTween(begin: AppColors.accent, end: AppColors.primary).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.75, // 1
          1,
          curve: Curves.easeInCubic,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getDemoAppBar(
        context,
        'Basic Staggered Animation',
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
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Positioned(
                  top: animatedPosition.value,
                  child: Container(
                    height: animationSize.value,
                    width: animationSize.value,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          animationSize.value,
                        ),
                      ),
                      color: animationColor.value,
                    ),
                    child: child,
                  ),
                ),
              ),
              AppButton(
                iconData: !isPlayed ? Icons.play_arrow : Icons.repeat,
                title: !isPlayed ? 'Play' : 'Repeat',
                onPressed: () {
                  if (!isPlayed) {
                    controller.forward();
                    setState(() {
                      isPlayed = true;
                    });
                  } else {
                    controller.reverse();
                    setState(() {
                      isPlayed = false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
