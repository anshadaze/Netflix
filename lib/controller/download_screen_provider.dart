import 'package:flutter/material.dart';

class DownloadScreenProvider extends ChangeNotifier{
  List imageList=[];


  void updateImageList(newList){
    imageList=newList;
    notifyListeners();
  }
}