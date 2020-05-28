// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/common/constants/app_colors.dart';
import 'package:flutter_staggered_animations/widgets/app_button.dart';
import 'package:flutter_staggered_animations/widgets/demo_appbar.dart';

class DemoBasicStaggeredListAnimationPage extends StatefulWidget {
  static const routeName = '/demo-basic-staggered-list-animation-page';

  @override
  State<StatefulWidget> createState() {
    return _DemoBasicStaggeredListAnimationPageState();
  }
}

class _DemoBasicStaggeredListAnimationPageState extends State
    with SingleTickerProviderStateMixin {
  bool isPlayed = false;
  AnimationController controller;
  Animation<double> pItem1;
  Animation<double> pItem2;
  Animation<double> pItem3;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    pItem1 = Tween(begin: 1000.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, // 1
          0.5,
          curve: Curves.ease,
        ),
      ),
    );

    pItem2 = Tween(begin: 1000.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.25, // 1
          0.75,
          curve: Curves.ease,
        ),
      ),
    );

    pItem3 = Tween(begin: 1000.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5, // 1
          1,
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
        'Staggered List',
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
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        // TODO: You can also use ListView here
                        Transform.translate(
                          offset: Offset(pItem1.value, 50),
                          child: Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              color: AppColors.accent,
                            ),
                            child: Center(
                              child: Text(
                                'Item 1',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(color: AppColors.primaryAccent),
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(pItem2.value, 175),
                          child: Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              color: AppColors.accent,
                            ),
                            child: Center(
                              child: Text(
                                'Item 2',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(color: AppColors.primaryAccent),
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(pItem3.value, 300),
                          child: Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              color: AppColors.accent,
                            ),
                            child: Center(
                              child: Text(
                                'Item 3',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(color: AppColors.primaryAccent),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
