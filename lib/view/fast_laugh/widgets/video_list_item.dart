import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/helpers/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
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
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage( "https://image.tmdb.org/t/p/w500//gPbM0MK8CP8A174rmUwGsADNYKD.jpg",),
                    ),
                  ),
                  VideoActionsWidget(icon: Icons.emoji_emotions, title:"LOL"),
                   VideoActionsWidget(icon: Icons.add, title:"My List"),
                   VideoActionsWidget(icon: Icons.share, title:"Share"),
                    VideoActionsWidget(icon: Icons.play_arrow, title:"Play"),
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
