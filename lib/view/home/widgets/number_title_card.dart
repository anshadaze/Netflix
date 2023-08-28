import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/view/home/widgets/number_card.dart';
import 'package:netflix/view/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     const MainTitle(
      title:"Top 10 TV Shows in india Today"),
      KHeight,
     LimitedBox(
      maxHeight: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:List.generate(10, (index) => NumberCard(index: index,))
        
        ,
      ),
     )
      ],
    );
      
  }
}