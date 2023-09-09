import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';

class TVTopRateServices{

   List<MovieInfoModel> tvtoprate = [];

  Future fetchTVTopRateMovies() async {
    try {
      final movies = await apiCall(ApiEndPoints.tvtoprate);
      tvtoprate = movies.results;
    } catch (error) {
      // Handle the error here
      print('Error fetching trending movies: $error');
    }
    return tvtoprate;
  }
}