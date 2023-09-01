import 'package:flutter/cupertino.dart';

class SearchQueryProvider extends ChangeNotifier{
  String _query='';


  String get query=>_query;

  void updateQuery(String newQuery){
    _query=newQuery;
    notifyListeners();
  }
}