import 'package:flutter/material.dart';
import 'package:netflix/controller/bottomnavbar_provider.dart';
import 'package:netflix/view/downloads/downloads_screen.dart';
import 'package:netflix/view/fastlaugh/fast_laugh_Screen.dart';
import 'package:netflix/view/home/home_screen.dart';
import 'package:netflix/view/mainpage/widgets/bottom_nav.dart';
import 'package:netflix/view/newandhot/new_and_hot_screen.dart';
import 'package:netflix/view/search/search_screen.dart';
import 'package:provider/provider.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});

  final pages=[
     const HomeScreen(),
     const NewAndHotScreen(),
     const FastLaughScreen(),
     const SearchScreen(),
     DownloadScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Consumer<SelectedIndexProvider>(
          builder: (context, provider, _) {
            return provider.selectedIndex < pages.length
                ? pages[provider.selectedIndex]
                : const Center(child: Text("Not Found"));
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidgets(),
    );
  }
}