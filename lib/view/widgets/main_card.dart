import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://www.themoviedb.org/t/p/w600_and_h900_bestv2/j91LJmcWo16CArFOoapsz84bwxb.jpg"))
      ),
    );
  }
}