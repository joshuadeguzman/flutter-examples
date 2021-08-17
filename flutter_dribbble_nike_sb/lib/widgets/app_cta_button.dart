// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class AppCtaButton extends StatefulWidget {
  final String title;
  final Function(bool isTapped)? onCtaTap;

  const AppCtaButton({
    Key? key,
    required this.title,
    this.onCtaTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppCtaButtonState();
  }
}

class _AppCtaButtonState extends State<AppCtaButton> {
  String get _title => widget.title;
  Function? get _onCtaTap => widget.onCtaTap;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.red,
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });

        if (_onCtaTap != null) _onCtaTap!(_isTapped);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        height: 40,
        width: 150,
        decoration: _getDecoration(),
        child: Center(
          child: Text(
            _title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _getDecoration() {
    if (_isTapped) {
      return BoxDecoration(
        color: Color(0xFFFF2D4C),
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2.5),
            color: Colors.red.shade600,
            blurRadius: 10,
          ),
        ],
      );
    } else {
      return BoxDecoration(
        border: Border.all(width: 2, color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      );
    }
  }
}
