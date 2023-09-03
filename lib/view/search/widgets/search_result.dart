import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/model/tmdb_api_response.dart';
import 'package:netflix/services/api_key.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';
import 'package:netflix/view/search/widgets/title.dart';


class SearchResultWidget extends StatelessWidget {
  final String apiQuery;
   SearchResultWidget({super.key,required this.apiQuery});


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Movies & TV"),
        KHeight,
        Expanded(child: FutureBuilder(
          future: apiCall(ApiEndPoints.searchmovie + apiQuery),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const Center(
                child: Column(children: [
                   CircularProgressIndicator(color: Colors.blue,),
                          Text('Please wait'),
                ]),
              );
            }

           
          TMDBApiResponseModel response=snapshot.data;

            if (response.results.isEmpty) {
                    return  const Center(child: Text('No Movies Found',style: TextStyle(fontSize: 20),));
                  }

                  return  GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1/1.4,
            children:List.generate(response.results.length, (index){
              MovieInfoModel movieInfo = response.results[index];
                if (movieInfo.posterPath != null) {
            String imageUrl = 'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
            return MainCard(imageUrl: imageUrl);
          }
          return const SizedBox();
            }),);
          },
         
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
   MainCard({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imageUrl),
        fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(7)
      ),
    );
  }
}