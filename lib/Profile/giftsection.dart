

import 'package:dating_site/Provider/videoProvider.dart';
import 'package:flutter/material.dart';

import '../Utils/color.dart';

class GiftSection extends StatefulWidget {
  const GiftSection({super.key});

  @override
  State<GiftSection> createState() => _GiftSectionState();
}

class _GiftSectionState extends State<GiftSection> {
  @override
  Widget build(BuildContext context) {
    final imageList = [
      'image/ring.jpeg',
      'image/jwel.jpg',
      'image/purse.jpg',
      'image/car.jpg',
      'image/cat.jpg',
      'image/dog.jpg',
      'image/cactus.jpg',
      'image/cookies.jpeg',
      'image/beer.jpg',
      'image/sur.jpg',
      'image/makeup.jpeg',
      'image/iphone.jpeg',
    ];

    final priceList = [
      '999 Credits',
      '800 Credits',
      '1200 Credits',
      '5000 Credits',
      '400 Credits',
      '450 Credits',
      '300 Credits',
      '350 Credits',
      '600 Credits',
      '750 Credits',
      '900 Credits',
      '1500 Credits',
    ];

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Start conversation with Virtual Gift!",
              style: Font.feed,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(imageList.length, (index) {
                return GestureDetector(
                  onTap: () {

                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imageList[index],
                          fit: BoxFit.contain,
                          height: 100,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        priceList[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

}

