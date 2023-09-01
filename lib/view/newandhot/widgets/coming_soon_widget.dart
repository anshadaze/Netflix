import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/home/widgets/button_widget.dart';
import 'package:netflix/view/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

 

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("FEB", style: TextStyle(fontSize: 16, color: kGreyColor)),
              Text(
                "11",
                style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AVATAR",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -5),
                  ),
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
              Text("Coming on Friday"),
              KHeight,
              Text(
                "AVATAR",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              KHeight,
              Text(
                  "It follows a blue-skinned humanoid Na'vi named Jake Sully (Worthington) as he and his family, under renewed human threat, seek refuge with the aquatic Metkayina clan of Pandora, a habitable exomoon on which they live.",
                     style: TextStyle(
                     color: kGreyColor
                ),)
            ],
          ),
        ),
      ],
    );
  }
}

