import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/home/widgets/button_widget.dart';
import 'package:netflix/view/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        KHeight,
         Text(
                  "Friends",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                KHeight,
              Text(
                    "This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work,life and love in 1990s manhattan.",
                       style: TextStyle(
                       color: kGreyColor
                  ),
                  ),
                  KHeight50,
                  VideoWidget(),
                  KHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                        CustomButtonWidget(
                          icon: Icons.share,
                          title: "Share",
                          iconSize: 25,
                          textSize: 16,
                        ),
                        KWidth,

                          CustomButtonWidget(
                          icon: Icons.add,
                          title: "My List",
                          iconSize: 25,
                          textSize: 16,
                        ),
                         KWidth,
                          CustomButtonWidget(
                          icon: Icons.play_arrow,
                          title: "Play",
                          iconSize: 25,
                          textSize: 15,
                        ),
                        KWidth
                    ],
                  )
      ],
    );
  }
}