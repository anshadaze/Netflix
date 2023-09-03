import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/controller/download_screen_provider.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/model/tmdb_api_response.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';
import 'package:provider/provider.dart';

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: KWhiteColor,
        ),
        KWidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class CenterSection extends StatefulWidget {
  CenterSection({super.key});

  @override
  State<CenterSection> createState() => _CenterSectionState();
}

class _CenterSectionState extends State<CenterSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeImages();
  }

  initializeImages() async {
    dynamic result = await apiCall(ApiEndPoints.trendingMovies);
    result == null ? debugPrint("null") : debugPrint("not null");
    if (result is TMDBApiResponseModel) {
      // Check if the result is of the correct type
      List newImageList = result.results.map((MovieInfoModel movieInfo) {
        if (movieInfo.posterPath == null) {
          return null;
        }

        String imageUrl =
            'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
        return imageUrl;
      }).toList();

      Provider.of<DownloadScreenProvider>(context, listen: false)
          .updateImageList(newImageList);
    }
  }

  @override
  Widget build(BuildContext context) {
    var downloadProvider = Provider.of<DownloadScreenProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: KWhiteColor, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        KHeight,
        const Text(
          "We wil download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        KHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: downloadProvider.imageList.length < 3
                ? []
                : [
                    CircleAvatar(
                      radius: size.width * 0.37,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    DownloadsImageWidget(
                      imageList: downloadProvider.imageList[0],
                      margin: const EdgeInsets.only(left: 170, top: 38),
                      angle: 25,
                      size: Size(size.width * 0.35, size.width * 0.55),
                    ),
                    DownloadsImageWidget(
                      imageList: downloadProvider.imageList[1],
                      margin: const EdgeInsets.only(right: 170, top: 38),
                      angle: -25,
                      size: Size(size.width * 0.35, size.width * 0.55),
                    ),
                    DownloadsImageWidget(
                      imageList: downloadProvider.imageList[2],
                      margin: const EdgeInsets.only(bottom: 25, top: 38),
                      size: Size(size.width * 0.4, size.width * 0.6),
                      radius: 8,
                    ),
                  ],
          ),
        ),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kBottonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Setup",
                style: TextStyle(
                    color: KWhiteColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        KHeight,
        MaterialButton(
          color: kBottonColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    required this.size,
    this.angle = 0,
    this.radius = 10,
    required EdgeInsets this.margin,
  });
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageList))),
          ),
        ),
      ),
    );
  }
}
