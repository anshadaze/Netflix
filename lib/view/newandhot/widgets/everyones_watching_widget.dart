import 'package:flutter/material.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';
import 'package:netflix/view/newandhot/widgets/evryones_watching_infocard.dart';


class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) { 
    return  FutureBuilder(
      future:apiCall(ApiEndPoints.moviepopular),
       builder:(context, snapshot) {
        if(!snapshot.hasData){
              const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                  Text('Please wait'),
                ],
              ),
            );

        }
        if(snapshot.data==null){
          return const Text('No data found');
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data.results.length,
          itemBuilder:(context, index) => 
          EveryonesWatchingInfoCard(movieInfo: snapshot.data.results[index],),);
           
       },);
  }
}