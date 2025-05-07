import 'package:dating_site/Profile/forumdetailpage.dart';
import 'package:dating_site/Screen/detailpage.dart';
import 'package:dating_site/Widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modal/ProfileData.dart';
import '../Provider/profileProvider.dart';
import '../Utils/color.dart';
import '../Widget/custombottomnavbar.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final imageList = [
      'image/f1.png',
      'image/f2.png',
      'image/f3.png',
      'image/f4.png',
      'image/f5.png',
      'image/f6.png',
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: _HeaderDelegate(),
              ),
         SingleChildScrollView(
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
                                  final favoriteProvider =
                                      Provider.of<ProfileProvider>(context);
                                  final isFav =
                                      favoriteProvider.isFavorite(index);
                                  final profileImage =
                                      imageList[index % imageList.length];

                                  return Card(
                                    color: Colors.white,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 4),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                ForumDetailPage(
                                                              description: '',
                                                              profile: {},
                                                              index: index,
                                                              name:
                                                                  profiles[index]
                                                                      ['name'],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 10),
                                                        child: Text(
                                                            'Flourish Fest: Where Women and Wildflowers Rise Together..',
                                                            style:
                                                                Font.boldFont4),
                                                      ),
                                                    ),
                                                    Text(
                                                      'I am a professional website developer and designer, having good knowledge of different web programming languages.',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Font.normalFont6,
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                ForumDetailPage(
                                                              name:
                                                                  profiles[index]
                                                                      ['name'],
                                                              description:
                                                                  'I am a professional website developer and designer, having good knowledge of different web programming languages. ' *
                                                                      3,
                                                              profile: {},
                                                              index: index,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: const Text(
                                                        '...Read more',
                                                        style: TextStyle(
                                                            color: Colors.pink,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            favoriteProvider
                                                                .toggleFavorite(
                                                                    index);
                                                          },
                                                          child: Icon(
                                                            isFav
                                                                ? Icons.favorite
                                                                : Icons
                                                                    .favorite_border,
                                                            color: isFav
                                                                ? Colors.red
                                                                : Colors.black87,
                                                            size: 25,
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5),
                                                        const Text('30'),
                                                        const SizedBox(width: 15),
                                                        const Icon(Icons.message,
                                                            size: 20),
                                                        const SizedBox(width: 5),
                                                        const Text('10'),
                                                        const SizedBox(width: 15),
                                                        Image.asset(
                                                            'image/seen.png',
                                                            height: 20,
                                                            width: 20),
                                                        const SizedBox(width: 5),
                                                        const Text('50'),
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
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(screenWidth: screenWidth),
    );
  }
}
class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.favorite, color: Colors.red),
              const SizedBox(width: 5),
              Text('MIX OF COLOR', style: Font.boldFont),
            ],
          ),
          Row(
            children: [
              Image.asset('image/bell.png', height: 20, width: 20),
              const SizedBox(width: 10),
              Image.asset('image/filter.png', height: 20, width: 20),
              const SizedBox(width: 10),
              Image.asset('image/profile.png', height: 20, width: 20),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}