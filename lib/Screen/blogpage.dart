

import 'package:dating_site/Profile/blogdetailsection.dart';
import 'package:dating_site/Utils/color.dart';
import 'package:dating_site/Widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modal/ProfileData.dart';
import '../Provider/profileProvider.dart';
import '../Widget/custombottomnavbar.dart';


class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final imageList = [
      'image/b1.png',
      'image/b2.png',
      'image/b3.png',
      'image/b4.png',
      'image/b5.png',
      'image/b6.png',
    ];

    return
      Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        SingleChildScrollView(

                          child: Column(
                            children: [
                              Header(),
                              SizedBox(height: 20),
                          ListView.builder(
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
                                                        builder: (context) => BlogDetailSection(description: '', profile: {}, index: index,    name: profiles[index]['name'],),
                                                      ),
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 10),
                                                    child: Text('How to Cultivate Creativity: Tips to Unleash Your Inner Artist...', style: Font.boldFont4),
                                                  ),
                                                ),
                                                Text(
                                                  'Explore proven methods and practical steps to tap into your creative potential. Whether youre an artist or simply looking for inspiration, this post will guide you to break through creative blo....',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Font.normalFont6,
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => BlogDetailSection(
                                                          name: profiles[index]['name'],
                                                          description:
                                                          'Explore proven methods and practical steps to tap into your creative potential. Whether youre an artist or simply looking for inspiration, this post will guide you to break through creative blo. Explore proven methods and practical steps to tap into your creative potential. Whether youre an artist or simply looking for inspiration, this post will guide you to break through creative blo....' *
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
                          ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(screenWidth: screenWidth),
      );
  }
}
