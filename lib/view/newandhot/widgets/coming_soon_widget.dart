import 'package:flutter/material.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';
import 'package:netflix/view/newandhot/widgets/coming_soon_info_card.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

 

  @override
  Widget build(BuildContext context) {
     
    return FutureBuilder(
      future:apiCall(ApiEndPoints.upcoming),
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

         if(snapshot.data==null){
          return const Text('No data found');

         }

         return ListView.builder(
          itemCount: snapshot.data.results.length,
          itemBuilder:(
            
            context, index) => ComingSoonInfoCard(movieInfo: snapshot.data.results[index],),);
       },);
  }
}

