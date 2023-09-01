

class MovieInfoModel{
   String? posterPath;











   MovieInfoModel({
    required this.posterPath,
   }
    );


    MovieInfoModel.fromjson(Map data){
      posterPath=data["poster_path"];
    }

   

    Map<String,dynamic>tojson(){
      Map<String, dynamic> data = <String, dynamic>{};
      data["poster_path"]=posterPath;



      return data;
    }



}