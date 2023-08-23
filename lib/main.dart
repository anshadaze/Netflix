import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily:GoogleFonts.montserrat().fontFamily,
        // backgroundColor: Colors.black,
        scaffoldBackgroundColor: backgroundColor,
       colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.black),
       textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2:  TextStyle(color: Colors.white),
       )
      ),
      home: ScreenMainPage(),
    );
  }
}
