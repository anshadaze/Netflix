import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/controller/search_query_provider.dart';
import 'package:netflix/view/search/widgets/search_idle.dart';
import 'package:netflix/view/search/widgets/search_result.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final searchQueryModel = Provider.of<SearchQueryProvider>(context);
    return Scaffold(
      body:SafeArea(child:
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CupertinoSearchTextField(
            onChanged: (value) {
             searchQueryModel.updateQuery(value);
            },
            backgroundColor: Colors.grey.withOpacity(0.4),
            prefixIcon: const Icon(CupertinoIcons.search,color: Colors.grey,),
            suffixIcon:const Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey) ,
            style: const TextStyle(color: Colors.white),
          ),
          KHeight,
           Expanded(child:searchQueryModel.query.isEmpty?const SearchIdleWidget():SearchResultWidget(apiQuery:searchQueryModel.query,)),
        ],),
      ) ),
       );
  }
}