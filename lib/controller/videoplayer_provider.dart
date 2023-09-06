import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerProvider extends ChangeNotifier{
 late VideoPlayerController videoPlayerController; 


  VideoPlayerState(String videoUrl) {
    late var VideoUrlvar = Uri.parse(videoUrl); 
    videoPlayerController = VideoPlayerController.networkUrl(VideoUrlvar)
      ..initialize().then((_) {
        videoPlayerController.play();
        notifyListeners();
      });
  }

  void videoPause(){
    videoPlayerController.pause();
    notifyListeners();
  }


  @override
  void dispose() {
    videoPlayerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  
}