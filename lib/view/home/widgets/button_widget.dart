import 'package:flutter/material.dart';
import 'package:netflix/helpers/colors/colors.dart';





class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconSize=30,
    this.textSize=18
  });
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,color: KWhiteColor,
        size: iconSize,),
        Text(title,style: TextStyle(fontSize:textSize,),)
      ],
    );
  }
}


class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        style:ButtonStyle(backgroundColor: MaterialStateProperty.all(KWhiteColor)),
        icon: const Icon(Icons.play_arrow,
        size: 25,
        color: kBlackColor,
        ),
        label:const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("Play",style: TextStyle(fontSize: 20,color: kBlackColor),),
        ),);
  }
}