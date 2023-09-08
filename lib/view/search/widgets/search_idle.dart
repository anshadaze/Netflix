import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/controller/searchidl_provider.dart';
import 'package:netflix/view/search/widgets/title.dart';
import 'package:provider/provider.dart';

class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SearchIDLProvider>(context, listen: false)
        .fetchSearchIDLMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: "Top Searches",
        ),
        KHeight,
        Expanded(
          child: Consumer<SearchIDLProvider>(
            builder: (context, value, child) {
              if(value.isLoading){
                return const Center(child: CircularProgressIndicator(),);
              }else if(value.trendingMovies.isEmpty){
                return const Text("NO data available");

              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    TopSearchItemTile(movieInfo: value.trendingMovies[index]),
                separatorBuilder: (context, index) => KHeight20,
                itemCount: value.trendingMovies.length,
              );
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final MovieInfoModel movieInfo;
  const TopSearchItemTile({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String url =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';

    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image:
                  DecorationImage(fit: BoxFit.cover, image: NetworkImage(url))),
        ),
        KWidth,
        Expanded(
          child: Text(
            movieInfo.title ?? "No Movie Name Found",
            style: const TextStyle(
                color: KWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: KWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: KWhiteColor,
            ),
          ),
        )
      ],
    );
  }
}
