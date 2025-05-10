import 'package:dating_site/Profile/aboutsection.dart';
import 'package:dating_site/Profile/blogsection.dart';
import 'package:dating_site/Profile/charitysection.dart';
import 'package:dating_site/Profile/eventsection.dart';
import 'package:dating_site/Profile/forumsection.dart';
import 'package:dating_site/Profile/gallerysection.dart';
import 'package:dating_site/Profile/giftsection.dart';
import 'package:dating_site/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/profileProvider.dart';
import '../Provider/tabprovider.dart';
import '../Widget/appbar.dart';
import '../Widget/custombottomnavbar.dart';

class ProfileDetailScreen extends StatelessWidget {
  final Map<String, dynamic> profile;
  final int index;

  const ProfileDetailScreen({
    required this.profile,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _HeaderDelegate(),
            ),
            SliverAppBar(
                expandedHeight: 250,
                pinned: true,
                backgroundColor: login,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${profile['name']} (${profile['age']})',
                      style: Font.profilename1.copyWith(fontSize: 20),
                    ),
                  ),
                  titlePadding: const EdgeInsets.only(left: 50, bottom: 1),
                  background: Stack(children: [
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
                      left: 50,
                      bottom: 130,
                      child: Row(
                        children: [
                          Text(profile['location'], style: Font.profileadd2),
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
                      left: 50,
                      bottom: 70,
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
                  ]),
                )),

            SliverToBoxAdapter(child: SizedBox(height: 10)),

            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarHeaderDelegate(),
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<TabProvider>(
                  builder: (context, tabProvider, child) {
                    switch (tabProvider.selectedTabIndex) {
                      case 0:
                        return const AboutSection();
                      case 1:
                        return const GallerySection();
                      case 2:
                        return const GiftSection();
                      case 3:
                        return const ForumSection();
                      case 4:
                        return const EventSection();
                      case 5:
                        return const BlogSection();
                      case 6:
                        return const CharitySection();
                      default:
                        return const SizedBox();
                    }
                  },
                ),
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

class _TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
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
                "Charity"
              ];
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(tabTitles.length, (tabIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () => tabProvider.changeTab(tabIndex),
                        child: Text(
                          tabTitles[tabIndex],
                          style: tabProvider.selectedTabIndex == tabIndex
                              ? Font.profileabout3.copyWith(
                            fontWeight: FontWeight.bold,
                            color: login,
                          )
                              : Font.profileabout3.copyWith(
                            fontWeight: FontWeight.normal,
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
          const SizedBox(height: 8),
          const Divider(height: 1),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}

