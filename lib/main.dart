import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/controller/download_screen_provider.dart';
import 'package:netflix/controller/search_query_provider.dart';
import 'package:netflix/controller/videoplayer_provider.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/mainpage/screen_main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DownloadScreenProvider(),),
        ChangeNotifierProvider(create: (context) => SearchQueryProvider(),),
        ChangeNotifierProvider(create: (context) => VideoPlayerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          fontFamily:GoogleFonts.montserrat().fontFamily,
          // backgroundColor: Colors.black,
          scaffoldBackgroundColor: backgroundColor,
         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.black),
         textTheme:const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium:  TextStyle(color: Colors.white),
         )
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
