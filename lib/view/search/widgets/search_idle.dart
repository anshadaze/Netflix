import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/search/widgets/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/iMUp44Tr7QrGidu1ldHF0NuG0h2.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Top Searches",),
        KHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
              itemBuilder: (context, index) =>const TopSearchItemTile() ,
              separatorBuilder: (context, index) =>KHeight20 ,
              itemCount: 10),
        )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return Row(children: [
   Container(
   width: screenWidth*0.35,
   height: 65,
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(imageUrl))
    ),
   ),
   KWidth,
   const Expanded(child: Text("Movie Name",style: TextStyle(color: KWhiteColor,fontWeight: FontWeight.bold,fontSize: 16),),),
   const CircleAvatar(
    backgroundColor: KWhiteColor,
    radius: 25,
    child:CircleAvatar(
      backgroundColor: kBlackColor,
      radius: 23,
      child: Icon(
        CupertinoIcons.play_fill,color: KWhiteColor,
      ),
    ) ,
   )

    ],);
  }
}
