// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/common/constants/app_colors.dart';
import 'package:flutter_staggered_animations/widgets/app_button.dart';
import 'package:flutter_staggered_animations/widgets/demo_appbar.dart';

class DemoBasicAnimationControllerPage extends StatefulWidget {
  static const routeName = '/demo-basic-animation-controller-page';

  @override
  State<StatefulWidget> createState() {
    return _DemoBasicAnimationControllerPageState();
  }
}

class _DemoBasicAnimationControllerPageState extends State
    with SingleTickerProviderStateMixin {
  bool isPlayed = false;
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // JDG-DEMO: 1
    );
    animation = Tween<double>(begin: 50, end: 1).animate(controller)
      ..addListener(() {
        print('animation value ${animation.value}');
      });
    // JDG-DEMO: Curve
    // CurvedAnimation(
    //   parent: controller,
    //   curve: Interval(
    //     0.0,
    //     1,
    //     curve: Curves.ease,
    //   ),
    // ),

    // JDG-DEMO: Breathing effect
    // ..addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getDemoAppBar(
        context,
        'AnimationController',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) => Container(
                      height: animation.value,
                      width: animation.value,
                      // JDG-DEMO: Breathing effect
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(
                      //     Radius.circular(animation.value / 2),
                      //   ),
                      //   color: AppColors.accent,
                      // ),
                      color: AppColors.accent,
                      child: child,
                    ),
                  ),
                ],
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
