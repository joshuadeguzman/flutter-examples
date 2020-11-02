import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Announcements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(24),
      physics: BouncingScrollPhysics(),
      children: [
        _AnnouncementsItem(
          title: "EPIC GAMES DAILY",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
          imagePath: "assets/images/epic-games.png",
        ),
        _AnnouncementsItem(
          title: "HALF-LIFE: ALYX UPDATES",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
          imagePath: "assets/images/half-life.png",
        ),
        _AnnouncementsItem(
          title: "BATTLE ROYALE - NEW CHARACTERS IN SHOP",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          imagePath: "assets/images/dark-rayven.png",
          isCoverMode: true,
        ),
      ],
    );
  }
}

class _AnnouncementsItem extends StatelessWidget {
  const _AnnouncementsItem({
    Key key,
    this.title,
    this.description,
    this.imagePath,
    this.isCoverMode = false,
  }) : super(key: key);

  final String title;
  final String description;
  final String imagePath;
  final bool isCoverMode;

  @override
  Widget build(BuildContext context) {
    if (isCoverMode) {
      return Container(
        height: 300,
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFF343962),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              spreadRadius: 10,
              blurRadius: 15,
              color: Color(0x50343962),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 165,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 170),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "10/31/2020",
                          style: TextStyle(
                            color: Color(0xFF6684E0),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.thumb_up_sharp,
                                color: Color(0xFF6684E0),
                                size: 12,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "485",
                                style: TextStyle(
                                  color: Color(0xFF6684E0),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.thumb_down,
                                color: Color(0xFFED6B74),
                                size: 12,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "25",
                                style: TextStyle(
                                  color: Color(0xFFED6B74),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
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
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 12,
      ),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF343962),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 5),
            spreadRadius: 10,
            blurRadius: 15,
            color: Color(0x50343962),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.only(right: 16),
                child: Image.asset(imagePath),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.exo2().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "10/31/2020",
                  style: TextStyle(
                    color: Color(0xFF6684E0),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Read More",
                        style: TextStyle(
                          color: Color(0xFF6684E0),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.launch,
                        color: Color(0xFF6684E0),
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
