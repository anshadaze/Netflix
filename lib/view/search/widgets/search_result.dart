import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/controller/internetconnectivity_provider.dart';
import 'package:netflix/controller/searchresult_provider.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/model/tmdb_api_response.dart';
import 'package:netflix/services/api_key.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/services/base_client.dart';
import 'package:netflix/view/search/widgets/title.dart';
import 'package:provider/provider.dart';


class SearchResultWidget extends StatefulWidget {
  final String apiQuery;
   SearchResultWidget({super.key,required this.apiQuery});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<SearchResultProvider>(context,listen: false).fetchSearchResult(widget.apiQuery);
    Provider.of<InternetConnectivityProvider>(context,listen: false).getInternetConnectivity(context);
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Movies & TV"),
        KHeight,
        Expanded(child: Consumer<SearchResultProvider>(
          builder: (context, provider, child) {
            return  GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1/1.4,
              children:List.generate(provider.searchResultMovies.length, (index){
                MovieInfoModel movieInfo = provider.searchResultMovies[index];
                  if (movieInfo.posterPath != null) {
              String imageUrl = 'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
              return MainCard(imageUrl: imageUrl);
            }
            return const SizedBox();
              }),);
          },
         
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
   MainCard({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imageUrl),
        fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(7)
      ),
    );
  }
}