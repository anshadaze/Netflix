import 'package:flutter/material.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';
import 'package:netflix/view/home/widgets/button_widget.dart';

class BackgroundCard extends StatefulWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setImage();
  }
  setImage()async{
    dynamic result=await apiCall(ApiEndPoints.moviepopular);
    setState(() {
        if(result.results.isNotEmpty){
      MovieInfoModel movieInfo =result.results[3];
        imageUrl =
            "https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768";
    }

    });
  
  }
    String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl ??"image not found"),
            ),
          ),
        ),
          const Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonWidget(icon: Icons.add,title: "My List",),
              PlayButton(),
              CustomButtonWidget(icon:Icons.info , title:"info")
            ],
          ),
        )
      ],
    );
  }
}