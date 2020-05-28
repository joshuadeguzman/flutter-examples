import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/common/constants/app_colors.dart';
import 'package:flutter_staggered_animations/router.dart';
import 'package:flutter_staggered_animations/screens/home_menu.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Flutter Staggered Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          headline: TextStyle(
            color: AppColors.accent,
            fontSize: 32,
          ),
          title: TextStyle(
            color: AppColors.accent,
            fontSize: 24,
          ),
          body1: TextStyle(
            color: AppColors.accent,
            fontSize: 16,
          ),
          body2: TextStyle(
            color: AppColors.accent,
            fontSize: 12,
          ),
        ),
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: HomeMenuPage.routeName,
    );
  }
}
