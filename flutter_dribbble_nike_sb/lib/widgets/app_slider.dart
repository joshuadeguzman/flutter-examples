// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  final double min;
  final double max;
  final int divisions;
  final double sliderValue;
  final List<double> sliderSteps;
  final Function(double value) onChangedValue;

  const AppSlider({
    Key key,
    @required this.min,
    @required this.max,
    @required this.divisions,
    @required this.sliderValue,
    @required this.sliderSteps,
    this.onChangedValue,
  })  : assert(
          min != null,
          'Min must not be null!',
        ),
        assert(
          max != null,
          'Max must not be null!',
        ),
        assert(
          divisions != null,
          'Discrete division must not be null!',
        ),
        assert(
          sliderValue != null,
          'Slider value must not be null!',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 325,
          child: SliderTheme(
            data: SliderThemeData(
              showValueIndicator: ShowValueIndicator.always,
              activeTrackColor: Color(0xFF484848),
              inactiveTrackColor: Color(0xFF484848),
              activeTickMarkColor: Color(0xFF484848),
              inactiveTickMarkColor: Color(0xFF484848),
              valueIndicatorColor: Color(0xFF484848),
              thumbColor: Color(0xFFFF2D4C),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 8),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
            ),
            child: Slider(
              value: sliderValue <= 0 ? min : sliderValue,
              min: min,
              max: max,
              divisions: divisions,
              onChanged: (double value) => onChangedValue(value),
            ),
          ),
        ),
        Container(
          height: 40,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: sliderSteps.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 40,
                width: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedDefaultTextStyle(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: Duration(milliseconds: 100),
                      child: Text(
                        sliderSteps[index].toString(),
                      ),
                      style: _getSliderStyle(
                        sliderSteps[index] == sliderValue,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  TextStyle _getSliderStyle(bool isSelected) {
    if (isSelected) {
      return TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
    } else {
      return TextStyle(
        fontSize: 16,
        color: Colors.white,
      );
    }
  }
}
