

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
      'image/g1.png',
      'image/g2.png',
      'image/g3.png',
      'image/g4.png',
      'image/g5.png',
      'image/g6.png',
      'image/g7.png',
      'image/g8.png',
      'image/g9.png',
      'image/g10.png',
      'image/g11.png',
      'image/g12.png',
      'image/g13.png',
      'image/g14.png',
      'image/g15.png',
      'image/g16.png',
      'image/g17.png',
      'image/g18.png',
      'image/g19.png',
      'image/g20.png',
      'image/g21.png',
      'image/g22.png',
      'image/g23.png',
      'image/g24.png',
      'image/g25.png',
      'image/g26.png',
      'image/g27.png',
      'image/g28.png',
      'image/g29.png',
      'image/g30.png',
      'image/g31.png',
      'image/g32.png',
      'image/g33.png',
      'image/g34.png',
      'image/g35.png',
      'image/g36.png',
      'image/g37.png',
      'image/g38.png',
      'image/g39.png',
      'image/g40.png',
      'image/g41.png',
      'image/g42.png',
      'image/g43.png',

      'image/g45.png',
      'image/g46.png',
      'image/g47.png',
      'image/g48.png',
      'image/g49.png',
      'image/g50.png',
      'image/g51.png',
      'image/g52.png',
      'image/g53.png',
      'image/g54.png',
      'image/g55.png',
      'image/g56.png',
      'image/g57.png',
      'image/g58.png',
      'image/g59.png',
      'image/g60.png',
      'image/g61.png',
      'image/g62.png',
      'image/g63.png',
      'image/g64.png',
      'image/g65.png',
      'image/g66.png',
      'image/g67.png',
      'image/g68.png',
      'image/g69.png',
      'image/g70.png',
      'image/g71.png',
      'image/g72.png',
      'image/g73.png',
      'image/g74.png',
      'image/g75.png',
      'image/g76.png',

      'image/g78.png',
      'image/g79.png',
      'image/g80.png',
      'image/g81.png',
      'image/g82.png',
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
      '450 Credits',
      '300 Credits',

    ];

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Start conversation with Virtual Gift! ",
              style: Font.feed,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.75,
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

