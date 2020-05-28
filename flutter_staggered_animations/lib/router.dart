// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/screens/animated_container.dart';
import 'package:flutter_staggered_animations/screens/animated_container_charts.dart';
import 'package:flutter_staggered_animations/screens/animated_positioned.dart';
import 'package:flutter_staggered_animations/screens/basic_animation_controller.dart';
import 'package:flutter_staggered_animations/screens/basic_staggered_animation.dart';
import 'package:flutter_staggered_animations/screens/basic_staggered_list.dart';
import 'package:flutter_staggered_animations/screens/demo_space.dart';
import 'package:flutter_staggered_animations/screens/home_menu.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeMenuPage.routeName:
        return MaterialPageRoute(builder: (_) => HomeMenuPage());
      case DemoAnimatedContainerPage.routeName:
        return MaterialPageRoute(builder: (_) => DemoAnimatedContainerPage());
      case DemoAnimatedContainerChartsPage.routeName:
        return MaterialPageRoute(
          builder: (_) => DemoAnimatedContainerChartsPage(),
        );
      case DemoAnimatedPositionedPage.routeName:
        return MaterialPageRoute(
          builder: (_) => DemoAnimatedPositionedPage(),
        );
      case DemoBasicAnimationControllerPage.routeName:
        return MaterialPageRoute(
          builder: (_) => DemoBasicAnimationControllerPage(),
        );
      case DemoBasicStaggeredAnimationPage.routeName:
        return MaterialPageRoute(
          builder: (_) => DemoBasicStaggeredAnimationPage(),
        );
      case DemoBasicStaggeredListAnimationPage.routeName:
        return MaterialPageRoute(
          builder: (_) => DemoBasicStaggeredListAnimationPage(),
        );
      case DemoSpacePage.routeName:
        return MaterialPageRoute(
          builder: (_) => DemoSpacePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Center(
            child: Text('Route not supported!'),
          ),
        );
    }
  }
}
