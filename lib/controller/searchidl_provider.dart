import 'package:flutter/material.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/services/searchidl_services.dart';

class SearchIDLProvider extends ChangeNotifier{
  List<MovieInfoModel> trendingMovies=[];
  bool isLoading=true;

Future fetchSearchIDLMovies()async{
trendingMovies=await searchIDLServices().fetchSearchMovies();
isLoading=false;
notifyListeners();

} 

}