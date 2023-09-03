import 'package:flutter/material.dart';
import 'package:netflix/helpers/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String? videoImage;
  const VideoWidget({
    super.key,
    this.videoImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            '$videoImage',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 22,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: KWhiteColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
