import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/view/widgets/app_bar_widget.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});
  final List imageList = [
    "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg",
    "https://image.tmdb.org/t/p/w500//gPbM0MK8CP8A174rmUwGsADNYKD.jpg",
    "https://image.tmdb.org/t/p/original/bvYjhsbxOBwpm8xLE5BhdA3a8CZ.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: "Downloads",
            )),
        body: ListView(
          children: [
            const Row(
              children: [
                Icon(
                  Icons.settings,
                  color: KWhiteColor,
                ),
                KWidth,
                Text("Smart Downloads")
              ],
            ),
            Text("Introducing Downloads for you"),
            Text(
                "We wil download a personalised selection of movies and shows for you, so there is always something to watch on your device"),
            Container(
              width: size.width,
              height: size.width,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: size.width * 0.37,
                  ),
                  DownloadsImageWidget(imageList: imageList[0], margin:EdgeInsets.only(left: 130,bottom: 50),angle: 20,size: Size(size.width*0.4,size.width*0.58),),
                  DownloadsImageWidget(imageList: imageList[1], margin:EdgeInsets.only(right: 130,bottom: 50),angle: -20,size: Size(size.width*0.4,size.width*0.58),),
                  DownloadsImageWidget(imageList: imageList[2], margin:EdgeInsets.only(left: 0),size: Size(size.width*0.5,size.width*0.68),),
                ],
              ),
            ),
            MaterialButton(
              color: kBottonColorBlue,
              onPressed: () {},
              child: const Text(
                "Setup",
                style: TextStyle(
                    color: KWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            MaterialButton(
              color: kBottonColorWhite,
              onPressed: () {},
              child: const Text(
                "See what you can download",
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    required this.size,
    this.angle=0,
    required EdgeInsets this.margin,
  });
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle*pi/180,
      child: Container(
        margin: margin,
        width: size.width,
        height:size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: NetworkImage(imageList))),
      ),
    );
  }
}
