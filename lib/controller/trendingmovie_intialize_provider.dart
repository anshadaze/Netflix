import 'package:flutter/material.dart';
import 'package:netflix/services/download_services.dart';

class TrendingMovieInitializeProvider extends ChangeNotifier{
  List imageList=[];
  bool isLoading=true;

   void initializeImages() async {
         imageList=await DownloadsServices().getTrendingMovies();
         isLoading=false;
         notifyListeners();
    }
  }
