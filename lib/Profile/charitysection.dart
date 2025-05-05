

import 'package:dating_site/Profile/charitydetailsection.dart';
import 'package:dating_site/Profile/eventdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modal/ProfileData.dart';
import '../Provider/profileProvider.dart';
import '../Utils/color.dart';

class CharitySection extends StatefulWidget {
  const CharitySection({super.key});

  @override
  State<CharitySection> createState() => _CharitySectionState();
}

class _CharitySectionState extends State<CharitySection> {
  @override
  Widget build(BuildContext context) {
    final imageList = [
      'image/c1.png',
      'image/c2.png',
      'image/c3.png',
      'image/c4.png',
      'image/c5.png',

    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        final favoriteProvider = Provider.of<ProfileProvider>(context);
        final isFav = favoriteProvider.isFavorite(index);
        final profileImage = imageList[index % imageList.length];

        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        profileImage,
                        height: 130,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CharityDetailSection(description: '', profile: {}, index: index,    name: profiles[index]['name'],),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text('Building a Solar-Powered School in a Rural Village', style: Font.boldFont4),
                            ),
                          ),
                          Text(
                            'Step into a brighter future where education shines with the power of the sun. This mission brings solar energy to remote schools, lighting up classrooms, empowering students, and crea',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Font.normalFont6,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CharityDetailSection(
                                    name: profiles[index]['name'],
                                    description:
                                    'Step into a brighter future where education shines with the power of the sun. This mission brings solar energy to remote schools, lighting up classrooms, empowering students, and crea. Welcome to the Flora section of our Nature Forum! This space is dedicated to the rich and diverse world of plant life — from the tiniest mosses to the tallest redwoods. Whether youre a passionate gardener, a botany student, or simply someone who admires the beauty of nature, this is the place to explore, learn, and share your love for all things green.,tep into the captivating world of Fauna — a realm teeming with life, movement, and mystery. This section is devoted to the animal kingdom in all its incredible forms, from the tiniest insects tOur Local Organic Farming Startup is a visionary initiative committed to revolutionizing the way food is grown, consumed, and valued within our communities. Rooted in the principles of sustainability, health, and environmental stewardship, our farm focuses on producing high-quality, chemical-free fruits, vegetables, and herbs using traditional organic practices enhanced with modern innovations. We strictly avoid synthetic pesticides, fertilizers, and genetically modified organisms, ensuring that every crop we grow is as natural as the soil it comes from. Our mission extends beyond cultivation we aim to reconnect people with the origins of their food, promote farm-to-table culture, and support the local economy by empowering small farmers through training, fair wages, and market access. By shortening the supply me, organically grown food.' *
                                        1, profile: {}, index: index,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              '...Read more',
                              style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text('Fund Required', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      Text('\$700', style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text('Feb 05,2025', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('(25 days left)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: LinearProgressIndicator(
                                      value: 0.55,
                                      minHeight: 8,
                                      backgroundColor: Colors.grey[300],
                                      valueColor: AlwaysStoppedAnimation<Color>(login),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      '55%',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
