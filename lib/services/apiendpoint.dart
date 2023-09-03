import 'package:netflix/constants/string.dart';
import 'package:netflix/services/api_key.dart';

class ApiEndPoints {
  static const trendingMovies = "$kBaseUrl/trending/all/day?api_key=$apikey";
  static const searchmovie = '$kBaseUrl/search/movie?api_key=$apikey&query=';
  static const upcoming =
      "$kBaseUrl/movie/upcoming?api_key=$apikey&language=en-US&page=1";
  static const moviepopular =
      '$kBaseUrl/movie/popular?api_key=$apikey&language=en-US&page=1';

        static const tvpopular =
      "$kBaseUrl/tv/popular?api_key=$apikey&language=en-US&page=1";
        static const tvtoprate =
      '$kBaseUrl/discover/tv?include_adult=false&language=en-US&page=1&sort_by=vote_average.desc&vote_count.gte=200&api_key=$apikey';
}
