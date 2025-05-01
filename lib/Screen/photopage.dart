


import 'package:dating_site/Screen/landingpage.dart';
import 'package:flutter/material.dart';

import '../Utils/color.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Padding(
        padding: const EdgeInsets.only(top:30),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Show your best self.",
                  style: Font.boldFont1),
              const SizedBox(height: 20),
              Text(
                'Upload up to six of your best photo to make a fantastic first impression. Let you personality shine.',
                style: Font.normalFont,
              ),
              SizedBox(
                height: 20,
              ),





            ],
          ),
        ),
      ),
    );
  }
}
