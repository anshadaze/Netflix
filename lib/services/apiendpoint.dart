import 'package:netflix/constants/string.dart';
import 'package:netflix/services/api_key.dart';

class ApiEndPoints{
 static const trendingMovies="$kBaseUrl/trending/all/day?api_key=$apikey";
 static const searchmovie='$kBaseUrl/search/movie?api_key=$apikey&query=';
}