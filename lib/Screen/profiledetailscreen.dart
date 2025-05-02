import 'package:dating_site/Profile/aboutsection.dart';
import 'package:dating_site/Profile/gallerysection.dart';
import 'package:dating_site/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/profileProvider.dart';
import '../Provider/tabprovider.dart';
import '../Widget/custombottomnavbar.dart';

class ProfileDetailScreen extends StatelessWidget {
  final Map<String, dynamic> profile;
  final int index;

  const ProfileDetailScreen(
      {required this.profile, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      //Image.asset('image/heart.png', height: 20, width: 20,),
                      SizedBox(width: 5),
                      Text('MIX OF COLOR', style: Font.boldFont),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'image/bell.png',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'image/filter.png',
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: SizedBox(
                  height: screenHeight * 0.5,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Image.asset(
                        profile['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 140,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black, Colors.transparent],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 120,
                        child: Row(
                          children: [
                            Text('${profile['name']} (${profile['age']})',
                                style: Font.profilename1),
                            const SizedBox(width: 10),
                            Consumer<ProfileProvider>(
                              builder: (context, profileProvider, child) {
                                final isFollowing =
                                    profileProvider.isFollowing(index);

                                return GestureDetector(
                                  onTap: () {
                                    profileProvider.toggleFollow(index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isFollowing
                                          ? login
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: Colors.white70, width: 1.0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    child: Text(
                                      isFollowing ? 'Following' : '+ Follow',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 10),
                            Consumer<ProfileProvider>(
                              builder: (context, provider, child) {
                                final isFav = provider.isFavorites(index);
                                return GestureDetector(
                                  onTap: () => provider.toggleFavorites(index),
                                  child: Icon(Icons.favorite,
                                      color: isFav ? Colors.red : Colors.white),
                                );
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset('image/comment.png'),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 100,
                        child:
                            Text(profile['location'], style: Font.profileadd2),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 35,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Follower',
                                  style: Font.profileadd1,
                                ),
                                Text(
                                  '${profile['follower']}K',
                                  style: Font.profileadd1,
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text(
                                  'Following',
                                  style: Font.profileadd1,
                                ),
                                Text(
                                  '${profile['following']}',
                                  style: Font.profileadd1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Consumer<TabProvider>(
                              builder: (context, tabProvider, child) {
                                final List<String> tabTitles = [
                                  "About",
                                  "Gallery",
                                  "Gift",
                                  "Forum",
                                  "Event",
                                  "Blog",
                                  "Charity",
                                ];

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(tabTitles.length,
                                        (index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: GestureDetector(
                                          onTap: () =>
                                              tabProvider.changeTab(index),
                                          child: Text(
                                            tabTitles[index],
                                            style: tabProvider
                                                        .selectedTabIndex ==
                                                    index
                                                ? Font.profileabout3.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: login,
                                                  )
                                                : Font.profileabout3.copyWith(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Consumer<TabProvider>(
                        builder: (context, tabProvider, child) {
                          switch (tabProvider.selectedTabIndex) {
                            case 0:
                              return const AboutSection();
                            case 1:
                              return const GallerySection();
                            default:
                              return const SizedBox();
                          }
                        },
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
