import 'package:flutter/material.dart';
import 'package:netflix/view/downloads/downloads_screen.dart';
import 'package:netflix/view/fastlaugh/fast_laugh_Screen.dart';
import 'package:netflix/view/home/home_screen.dart';
import 'package:netflix/view/mainpage/widgets/bottom_nav.dart';
import 'package:netflix/view/newandhot/new_and_hot_screen.dart';
import 'package:netflix/view/search/search_screen.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});

  final pages=[
     HomeScreen(),
     NewAndHotScreen(),
     FastLaughScreen(),
     SearchScreen(),
     DownloadScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context,int index, _) {
          return pages[index];
        },),
      ),
      bottomNavigationBar: BottomNavigationWidgets(),
    );
  }
}