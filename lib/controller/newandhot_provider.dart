import 'package:flutter/material.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/services/newandhot_services.dart';

class NewAndHotProvider extends ChangeNotifier{
  List<MovieInfoModel>upcomingMovies=[];
  List<MovieInfoModel>moviepopular=[];
  bool isLoading=true;

  Future fetchComingSoonMovies()async{
    upcomingMovies=await NewAndHotServices().fetchUpcomingMovies();
    isLoading=false;
    notifyListeners();
  }

  Future fetchEveryoneWatchingMovies()async{
    moviepopular=await NewAndHotServices().fetchMoviePopular();
    isLoading=false;
    notifyListeners();
  }




}