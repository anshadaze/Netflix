

class MovieInfoModel{
   String? posterPath;
   String? title;











   MovieInfoModel({
    required this.posterPath,
    required this.title,
   }
    );


    MovieInfoModel.fromjson(Map data){
      posterPath=data["poster_path"];
      title = data['title'];
    }

   

    Map<String,dynamic>tojson(){
      Map<String, dynamic> data = <String, dynamic>{};
      data["poster_path"]=posterPath;
      data['title'] = title;


      return data;
    }



}