import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/view/new_and_hot/widgets/everyones_watching_widget.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: AppBar(
                title: const Text(
                  "New& Hot",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                actions: [
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
                bottom: TabBar(
                    unselectedLabelColor: KWhiteColor,
                    labelColor: kBlackColor,
                    isScrollable: true,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    indicator: BoxDecoration(
                      color: KWhiteColor,
                      borderRadius: kRadius30,
                    ),
                    tabs: const [
                      Tab(
                        text: "🍿 Coming Soon",
                      ),
                      Tab(
                        text: "👀 Everyone's Watching",
                      )
                    ]),
              )),
          body: TabBarView(
            children: [_buildComingSoon(context), _BuildEveryonesWatching()],
          )),
    );
  }
}

Widget _BuildEveryonesWatching() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) => const EveryonesWatchingWidget(),
  );
}

Widget _buildComingSoon(BuildContext context) {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return const ComingSoonWidget();
    },
  );
}
