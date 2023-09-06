import 'package:flutter/material.dart';
import 'package:netflix/services/home_backgroundcard_services.dart';

class HomeBackgroundCardImageProvider with ChangeNotifier {
  String? imageUrl;

  void initializeBackgroundCard()async{
    imageUrl=await HomeBackgroundCardServices().setImage();
    notifyListeners();
  }


  


}