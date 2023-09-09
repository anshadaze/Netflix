import 'package:flutter/cupertino.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/services/tvtoprete_services.dart';

class TvTopRateProvider extends ChangeNotifier{

 List<MovieInfoModel> tvTopRate=[];
  bool isLoading=true;

Future fetchTvTopRateMovies()async{
tvTopRate=await TVTopRateServices().fetchTVTopRateMovies();
isLoading=false;
notifyListeners();

} 

}