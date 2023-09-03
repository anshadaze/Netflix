import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/services/apiendpoint.dart';
import 'package:netflix/view/home/widgets/background_card.dart';
import 'package:netflix/view/home/widgets/number_title_card.dart';
import 'package:netflix/view/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotier,
      builder: (context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (Notification) {
            final ScrollDirection direction = Notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: const[
                  BackgroundCard(),
                  MainTitleCard(
                    title: "New Releases",
                    apiUrl: ApiEndPoints.moviepopular,
                  ),
                  KHeight,
                  MainTitleCard(
                    title: "Trending Now",
                    apiUrl: ApiEndPoints.trendingMovies,
                  ),
                  KHeight,
                  NumberTitleCard(),
                  KHeight,
                  MainTitleCard(
                    title: "Popular Shows",
                    apiUrl: ApiEndPoints.tvpopular,
                  ),
                  KHeight,
                  MainTitleCard(
                    title: "Upcoming",
                    apiUrl: ApiEndPoints.upcoming,
                  )
                ],
              ),
              scrollNotier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: double.infinity,
                      height: 80,
                      color: Colors.black.withOpacity(0.6),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Netflix_2015_N_logo.svg/640px-Netflix_2015_N_logo.svg.png",
                                width: 40,
                                height: 40,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 30,
                              ),
                              KWidth,
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Image.asset("assets/avatar.png"),
                              ),
                              KWidth
                            ],
                          ),
                          KHeight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "TV Shows",
                                style: kHomeTitleText,
                              ),
                              Text("Movies", style: kHomeTitleText),
                              Text("Categories", style: kHomeTitleText)
                            ],
                          ),
                        ],
                      ),
                    )
                  : KHeight
            ],
          ),
        );
      },
    ));
  }
}
