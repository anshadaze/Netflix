import 'package:flutter/material.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/model/tmdb_api_response.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';

class TrendingMovieInitializeProvider extends ChangeNotifier{
  List imageList=[];

   initializeImages() async {
    dynamic result = await apiCall(ApiEndPoints.trendingMovies);
    result == null ? debugPrint("null") : debugPrint("not null");
    if (result is TMDBApiResponseModel) {
      // Check if the result is of the correct type
      imageList = result.results.map((MovieInfoModel movieInfo) {
        if (movieInfo.posterPath == null) {
          return null;
        }

        String imageUrl =
            'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
        return imageUrl;
      }).toList();

      notifyListeners();

      // Provider.of<DownloadScreenProvider>(context, listen: false)
      //     .updateImageList(newImageList);
    }
  }
}