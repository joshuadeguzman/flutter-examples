// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/common/constants/app_colors.dart';
import 'package:flutter_staggered_animations/widgets/app_button.dart';
import 'package:flutter_staggered_animations/widgets/demo_appbar.dart';

class DemoSpacePage extends StatefulWidget {
  static const routeName = '/demo-space-state';

  @override
  State<StatefulWidget> createState() {
    return _DemoSpacePageState();
  }
}

class _DemoSpacePageState extends State with SingleTickerProviderStateMixin {
  bool isPlayed = false;
  AnimationController controller;
  Animation<double> spacePositionY;
  Animation<double> spacePositionX;
  Animation<double> podSize;
  Animation<double> podRotate;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    spacePositionY = Tween<double>(begin: -100, end: -500.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    spacePositionX = Tween<double>(begin: 25, end: 100).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.50,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    podSize = Tween<double>(begin: 50, end: 150).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.25,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    podRotate = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.50,
          0.75,
          curve: Curves.ease,
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
        '#LaunchAmerica',
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
          padding: const EdgeInsets.only(top: 16),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  'assets/background.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Transform.translate(
                  offset: Offset(spacePositionX.value, spacePositionY.value),
                  child: Transform.rotate(
                    angle: podRotate.value,
                    child: Container(
                      height: podSize.value,
                      width: podSize.value,
                      child: child,
                    ),
                  ),
                ),
                child: Image.asset(
                  'assets/pod.png',
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
