import 'package:flutter/material.dart';
import 'package:netflix/controller/home_screen_backgroundcard_provider.dart';
import 'package:netflix/view/home/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class BackgroundCard extends StatefulWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeBackgroundCardImageProvider>(context,listen: false).setImage();
  }
  
   

  @override
  Widget build(BuildContext context) {
    // var imageProvider=Provider.of<HomeBackgroundCardImageProvider>(context);
    return Consumer<HomeBackgroundCardImageProvider>(
      builder: (context, value, child) {
        return   Stack(
        children: [
          Container(
            width: double.infinity,
            height: 600,
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(value.imageUrl ??"image not found"),
              ),
            ),
          ),
            const Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(icon: Icons.add,title: "My List",),
                PlayButton(),
                CustomButtonWidget(icon:Icons.info , title:"info")
              ],
            ),
          )
        ],
      );
      },
     
    );
  }
}