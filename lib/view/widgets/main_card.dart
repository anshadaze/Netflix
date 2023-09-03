import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';

class MainCardWidget extends StatelessWidget {
  final String imageUrlFromApi;
  const MainCardWidget({
    super.key,
    required this.imageUrlFromApi
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrlFromApi))
      ),
    );
  }
}