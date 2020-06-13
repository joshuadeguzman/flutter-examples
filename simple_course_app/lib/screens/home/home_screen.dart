import 'package:flutter/material.dart';
import 'package:simple_course_app/screens/detail/detail_screen.dart';
import 'package:simple_course_app/screens/home/widgets/course_category.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SizedBox(
            height: 24,
            width: 24,
            child: Image.asset("assets/images/menu.png"),
          ),
          onPressed: () {
            debugPrint("menu is pressed");
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: SizedBox(
                height: 40,
                width: 40,
                child: Image.asset("assets/images/profile.png"),
              ),
              onPressed: () {
                debugPrint("profileImage is pressed");
              },
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Hey Joshua",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "Find a course you want to learn",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF61688B),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F7),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset("assets/images/search.png"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 24),
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search for anything",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFA0A5BD),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D1333),
                        ),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6E8AFA),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 200 / 250,
                    children: <Widget>[
                      CourseCategory(
                        imagePath: "assets/images/marketing.png",
                        title: "Marketing",
                        numberOfCourses: 17,
                      ),
                      // TODO: Add the onTap callback to the widget
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(),
                            ),
                          );
                        },
                        child: CourseCategory(
                          imagePath: "assets/images/ux.png",
                          title: "UX Design",
                          numberOfCourses: 25,
                        ),
                      ),
                      CourseCategory(
                        imagePath: "assets/images/photography.png",
                        title: "Photography",
                        numberOfCourses: 13,
                      ),
                      CourseCategory(
                        imagePath: "assets/images/business.png",
                        title: "Business",
                        numberOfCourses: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
