import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';
import 'package:netflix/view/search/widgets/title.dart';


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
          child: FutureBuilder(
            future: apiCall(ApiEndPoints.trendingMovies),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                 const Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(color: Colors.blue,),
                          Text('Please wait'),
                        ],
                      ),
                    );
              }
              if (snapshot.data == null) {
                    return const Text("No data found");
                  }
                  return   ListView.separated(
                 shrinkWrap: true,
                itemBuilder: (context, index) => TopSearchItemTile(movieInfo: snapshot.data.results[index],) ,
                separatorBuilder: (context, index) =>KHeight20 ,
                itemCount:20);
            },
        
           
          ),
        )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  final MovieInfoModel movieInfo;
  const TopSearchItemTile({super.key,required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
     String url ='https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';

    return Row(children: [
   Container(
   width: screenWidth*0.35,
   height: 65,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(url))
    ),
   ),
   KWidth,
    Expanded(
    child: Text(movieInfo.title??"No Movie Name Found",
    style: const TextStyle(color: KWhiteColor,fontWeight: FontWeight.bold,fontSize: 16),),),
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
