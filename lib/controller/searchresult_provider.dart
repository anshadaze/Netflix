import 'package:flutter/material.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/services/searchresult_services.dart';

class SearchResultProvider extends ChangeNotifier{
   List<MovieInfoModel>searchResultMovies=[];
   
   

   Future fetchSearchResult(String apiQuery)async{
    searchResultMovies=await SearchResultServices().fetchSearchResultMovies(apiQuery);
    notifyListeners();
   }
}