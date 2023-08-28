import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/constants/constants.dart';
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
                children: const [
                  BackgroundCard(),
                  MainTitleCard(
                    title: "Released in the past year",
                  ),
                  KHeight,
                  MainTitleCard(
                    title: "Trending Now",
                  ),
                  KHeight,
                  NumberTitleCard(),
                  KHeight,
                  MainTitleCard(
                    title: "Tense Dramas",
                  ),
                  KHeight,
                  MainTitleCard(
                    title: "South Indian Cinima",
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
                                "https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=700&h=456",
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
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          KHeight,

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("TV Shows",style:kHomeTitleText ,),
                            Text("Movies",style:kHomeTitleText ),
                            Text("Categories",style:kHomeTitleText )
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
