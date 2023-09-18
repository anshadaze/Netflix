import 'package:flutter/cupertino.dart';

class SearchQueryProvider extends ChangeNotifier{
  String query='';


  

  void updateQuery(String newQuery){
    query=newQuery;
    notifyListeners();
  }
}