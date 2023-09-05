import 'package:flutter/material.dart';
import 'package:netflix/controller/videoplayer_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl,
       });

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
 
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<VideoPlayerProvider>(context,listen: false).VideoPlayerState(widget.videoUrl);
  }

  @override
  Widget build(BuildContext context) {
    var videoPlayerProvider=Provider.of<VideoPlayerProvider>(context);
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: videoPlayerProvider.videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoPlayerProvider.videoPlayerController.value.aspectRatio,
                child: GestureDetector(
                    onTap: () {
                      
                        videoPlayerProvider.videoPause();
                    
                    },
                    child: VideoPlayer(videoPlayerProvider.videoPlayerController)))
            : const Center(
                child: CircularProgressIndicator(),
              )
              );
       
      
  }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   Provider.of<VideoPlayerProvider>(context,listen: false).dispose();
  // }
   
}
