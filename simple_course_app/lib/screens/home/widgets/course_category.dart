import 'package:flutter/material.dart';

class CourseCategory extends StatelessWidget {
  final String imagePath;
  final String title;
  final int numberOfCourses;

  const CourseCategory({
    Key key,
    this.imagePath,
    this.title,
    this.numberOfCourses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: 200,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 24,
              left: 24,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 48,
              left: 24,
              child: Text(
                "$numberOfCourses courses",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8F95B2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
