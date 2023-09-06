import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/view/home/widgets/button_widget.dart';
import 'package:netflix/view/widgets/video_widget.dart';

class ComingSoonInfoCard extends StatelessWidget {
  final MovieInfoModel movieInfo;
  const ComingSoonInfoCard({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(fetchDate(movieInfo.releaseDate!),
                  style: const TextStyle(fontSize: 16, color: kGreyColor)),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 480,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                videoImage: imageUrl,
              ),
              const Row(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.add_alert_rounded,
                        title: "Remind me",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      KWidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: "Info",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      KWidth
                    ],
                  ),
                ],
              ),
              KHeight,
              Text("Coming on ${fetchDay(movieInfo.releaseDate!)}"),
              KHeight,
              Text(
                movieInfo.originalTitle ?? 'Empty Title',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              KHeight,
              Text(
                movieInfo.overview,
                style: const TextStyle(color: kGreyColor),
              )
            ],
          ),
        ),
      ],
    );
  }

  String fetchDate(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");

    return "${formatDate.first.substring(0, 3)} \n${formatDate.last}";
  }

  String fetchDay(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInFormat);
    return dayName;
  }
}
