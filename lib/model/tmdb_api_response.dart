import 'package:netflix/model/movie_info_model.dart';

class TMDBApiResponseModel{
  List<MovieInfoModel>results=[];

  TMDBApiResponseModel.fromjson(Map data){
       results = (data['results'] as List)
        .map((item) => MovieInfoModel.fromjson(item))
        .where((movieInfo) => movieInfo != null) // Filter out null values
        .toList();
  }

  Map<String,dynamic>tojson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results']=results.map((MovieInfoModel movieInfo)=>movieInfo.tojson()).toList();
    return data;
  }
}