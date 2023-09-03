
import 'package:flutter/material.dart';
import 'package:netflix/controller/download_screen_provider.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/services/api_key.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';
import 'package:netflix/view/fastlaugh/widgets/fat_laugh_videoplayer.dart';
import 'package:provider/provider.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4"
];

class VideoListItem extends StatefulWidget {
  final int index;
 VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
  
}

class _VideoListItemState extends State<VideoListItem> {
  // List imageList=[];


  
  fetchTrendingPosterPath()async{
    dynamic result=await apiCall(ApiEndPoints.trendingMovies);
    List newimageList=result.results.map((MovieInfoModel result){
      String imageUrl="https://image.tmdb.org/t/p/w500/${result.posterPath}?api_key=$apikey";
      return imageUrl;
    }).toList();

     Provider.of<DownloadScreenProvider>(context, listen: false)
          .updateImageList(newimageList);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTrendingPosterPath();
  }
  @override
  Widget build(BuildContext context) {
    var imageListProvider = Provider.of<DownloadScreenProvider>(context);
    final videoUrl=dummyVideoUrls[widget.index % dummyVideoUrls.length];

    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrl, 
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
    
                

                ///left side
               CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: (){},
                    icon: const Icon(
                      Icons.volume_off,
                      color: KWhiteColor,
                      size: 30,
                    ),
                  ),
                ),

              ///right side
              imageListProvider.imageList.isEmpty?SizedBox(): Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage( 
                       imageListProvider. imageList[widget.index],
                      ),
                    ),
                  ),
                  const VideoActionsWidget(icon: Icons.emoji_emotions, title:"LOL"),
                   const VideoActionsWidget(icon: Icons.add, title:"My List"),
                   const VideoActionsWidget(icon: Icons.share, title:"Share"),
                    const VideoActionsWidget(icon: Icons.play_arrow, title:"Play"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(icon,color: Colors.white,size: 30,),
          Text(title,style: const TextStyle(
            color: KWhiteColor,fontSize: 16
          ),)
        ],
      ),
    );
  }
}
