import 'package:flutter/material.dart';

class LevelProgress extends StatelessWidget {
  const LevelProgress({
    Key key,
    @required this.imagePath,
    @required this.game,
    this.trophies = 0,
    this.medals = 0,
    this.hours = 0,
  }) : super(key: key);

  final String imagePath;
  final String game;
  final int trophies;
  final int medals;
  final int hours;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 250,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitWidth,
              ),
            ),
            Opacity(
              opacity: 0.2,
              child: Container(
                height: 250,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 24,
                left: 350,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Level Progress",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  offset: Offset(0, 5),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "in $game",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(0, 5),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white38,
                                  offset: Offset(0, 2.5),
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                children: [
                                  Container(
                                    color: Color(0xFFA54BB9),
                                    width: 300,
                                    height: 7.5,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 200,
                                    height: 7.5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 24,
                      right: 48,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0x50674C9A),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            "🏆 $trophies",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0x50674C9A),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            "🥇 $medals",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0x50674C9A),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            "🕒 $hours h",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
