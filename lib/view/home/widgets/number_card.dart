import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key,required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,height: 200,),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://www.themoviedb.org/t/p/w600_and_h900_bestv2/j91LJmcWo16CArFOoapsz84bwxb.jpg"))
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -20,
          child: BorderedText(
            strokeColor:KWhiteColor,
            strokeWidth: 10.0,
            child: Text("${index+1}",style: const TextStyle(
              fontSize: 140,
              color: kBlackColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,),))),
      ],
    );
  }
}