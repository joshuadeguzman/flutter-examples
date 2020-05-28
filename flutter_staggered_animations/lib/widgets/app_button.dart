// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/common/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final IconData kIcon = Icons.code;

  final Function onPressed;
  final String title;
  final IconData iconData;
  final Widget child;

  const AppButton({
    Key key,
    this.onPressed,
    this.title,
    this.iconData,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 32,
          right: 32,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          child: Container(
            child: MaterialButton(
              color: AppColors.primary,
              onPressed: onPressed,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      iconData != null ? iconData : Icons.code,
                      size: 24,
                    ),
                    SizedBox(width: 12),
                    // Show the title view if the child parameter is not empty
                    child != null
                        ? child
                        : Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
