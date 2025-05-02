

import 'package:dating_site/Utils/color.dart';
import 'package:flutter/material.dart';

class GallerySection extends StatefulWidget {
  const GallerySection({super.key});

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          SizedBox(height: 10),
          Row(
mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset('image/pic.png', height: 40,width: 40,),
                  //SizedBox(width: 5,),
                  Text("Picture", style: Font.notbold),
                ],
              ),
SizedBox(width: 80,),
              Row(
                children: [
                  Image.asset('image/vido.png'),
                  SizedBox(width: 10,),
                  Text("Video", style: Font.notbold),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),

        ],
      ),
    );
  }
}
