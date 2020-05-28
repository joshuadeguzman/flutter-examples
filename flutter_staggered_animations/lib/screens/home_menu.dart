// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/common/constants/app_colors.dart';
import 'package:flutter_staggered_animations/screens/animated_container.dart';
import 'package:flutter_staggered_animations/screens/animated_container_charts.dart';
import 'package:flutter_staggered_animations/screens/animated_positioned.dart';
import 'package:flutter_staggered_animations/screens/basic_animation_controller.dart';
import 'package:flutter_staggered_animations/screens/basic_staggered_animation.dart';
import 'package:flutter_staggered_animations/screens/basic_staggered_list.dart';
import 'package:flutter_staggered_animations/screens/demo_space.dart';
import 'package:flutter_staggered_animations/widgets/app_button.dart';
import 'package:share/share.dart';

class HomeMenuPage extends StatelessWidget {
  static const routeName = '/home-menu-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            'Nutshell',
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Share.share(
                'Download Nutshell on https://github.com/joshuadeguzman!',
                subject: 'Flutter Staggered Animations',
              );
            },
            icon: Icon(
              Icons.share,
              color: AppColors.accent,
            ),
          ),
          SizedBox(
            width: 4,
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            _MenuSpacer(),
            _HeaderText(
              title: 'Implicitly Animated Widgets',
            ),
            AppButton(
              iconData: Icons.border_style,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DemoAnimatedContainerPage.routeName,
                );
              },
              title: 'AnimatedContainer',
            ),
            _MenuSpacer(),
            AppButton(
              iconData: Icons.pie_chart,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DemoAnimatedContainerChartsPage.routeName,
                );
              },
              title: 'Bar Charts Example',
            ),
            _MenuSpacer(),
            AppButton(
              iconData: Icons.border_inner,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DemoAnimatedPositionedPage.routeName,
                );
              },
              title: 'AnimatedPositioned',
            ),
            _MenuSpacer(),
            _HeaderText(
              title: 'Explicitly Animated Widgets',
            ),
            AppButton(
              iconData: Icons.play_arrow,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DemoBasicAnimationControllerPage.routeName,
                );
              },
              title: 'AnimationController',
            ),
            _MenuSpacer(),
            AppButton(
              iconData: Icons.movie,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DemoBasicStaggeredAnimationPage.routeName,
                );
              },
              title: 'Basic Staggered Animation',
            ),
            _MenuSpacer(),
            AppButton(
              iconData: Icons.list,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DemoBasicStaggeredListAnimationPage.routeName,
                );
              },
              title: 'Staggered List',
            ),
            _MenuSpacer(),
            AppButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DemoSpacePage.routeName,
                );
              },
              title: 'Create Staggered Animation',
            ),
            _HeaderText(
              title: 'Drawing Based Animations',
            ),
            AppButton(
              onPressed: () {
                debugPrint('Rive');
              },
              title: 'Rive',
            ),
            _MenuSpacer(),
            AppButton(
              onPressed: () {
                debugPrint('Lottie');
              },
              title: 'Lottie',
            ),
            _MenuSpacer(),
          ],
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String title;

  const _HeaderText({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _MenuSpacer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 12);
  }
}
