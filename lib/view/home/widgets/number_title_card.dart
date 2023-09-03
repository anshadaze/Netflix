import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';
import 'package:netflix/view/home/widgets/number_card.dart';
import 'package:netflix/view/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List imageList=[];
    return 
        FutureBuilder(
          future: apiCall(ApiEndPoints.tvtoprate),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
               return Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(color: Colors.blue,),
                          Text('Please wait'),
                        ],
                      ),
                    );
            }

            if(snapshot.data==null){
              return const Center(child:  Text('No data found'));
            }

             imageList = snapshot.data.results.map((MovieInfoModel movieInfo) {
              if (movieInfo.posterPath == null) {
                return null;
              }
              String imageUrl =
                  'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
              return imageUrl;
            }).toList();
            
             if (imageList.isEmpty) {
            return const Center(child: ListTile(title: Text('No Movies Found')));
          }

          return    Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             const MainTitle(
              title:"Top 10 TV Shows in india Today"),
              KHeight,
             LimitedBox(
              maxHeight: 200,
              child: ListView(
          scrollDirection: Axis.horizontal,
          children:List.generate(10, (index) => NumberCard(index: index,imageUrl: imageList[index],))
          
          ,
              ),
             )
              ],
            );
          },
      
        );
      
  }
}