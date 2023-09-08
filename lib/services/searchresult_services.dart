import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';

class SearchResultServices{
  List<MovieInfoModel>searchResultMovies=[];

  Future fetchSearchResultMovies(String apiQuery)async{
    try {
      final movies=await apiCall(ApiEndPoints.searchmovie + apiQuery);
      searchResultMovies=movies.results;
      
    } catch (error) {
      print("Error fetching trendng movies:$error");
    }
    return searchResultMovies;
  }
}