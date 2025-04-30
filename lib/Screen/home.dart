
import 'package:dating_site/Modal/ProfileData.dart';
import 'package:dating_site/Provider/profileProvider.dart';
import 'package:dating_site/Screen/profilecard.dart';
import 'package:dating_site/Screen/profilecarddetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

import '../Modal/ProfileData.dart';
import '../Utils/color.dart';
import '../Widget/custombottomnavbar.dart';

class Home extends StatefulWidget {
  final Map<String, dynamic> profile;
  final int index;
  const Home({required this.profile, required this.index});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final profiles = Provider.of<ProfileProvider>(context).profiles;
    final profileProvider = Provider.of<ProfileProvider>(context);
    //final profiles = profileProvider.profiles;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.red,),
                            //Image.asset('image/heart.png', height: 20, width: 20,),
                            SizedBox(width: 5),
                            Text('MIX OF COLOR', style: Font.boldFont),
                          ],
                        ),
                        Spacer(),
                        Image.asset('image/bell.png', height: 20,width: 20,),
                       SizedBox(width: 10),
                        Image.asset('image/filter.png', height: 20,width: 20,),

                      ],
                    ),
                    SizedBox(height: 20),
                    SafeArea(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SafeArea(
                          child: SizedBox(

                            height: 670,
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: CardSwiper(
                                cardsCount: profiles.length,
                                onSwipe: (prevIndex, currentIndex, direction) {
                                  return true;
                                },
                                cardBuilder: (
                                    BuildContext context,
                                    int index,
                                    int horizontalOffsetPercentage,
                                    int verticalOffsetPercentage,
                                    ) {
                                  final profile = profiles[index];
                                  return GestureDetector(
                                    onVerticalDragEnd: (details) {
                                      if (details.primaryVelocity! < 0) {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                          ),
                                          builder: (BuildContext context) {
                                            return Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                 Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(12),
                                                        child:
                                                        SingleChildScrollView(
                                                          scrollDirection: Axis.horizontal,
                                                          child: Row(
                                                            children:
                                                            [
                                                              CategoryItem(context, 'About | '),
                                                              CategoryItem(context, 'Gallery | '),
                                                              CategoryItem(context, 'Gift | '),
                                                              CategoryItem(context, 'Forum | '),
                                                              CategoryItem(context, 'Event | '),
                                                              CategoryItem(context, 'Blog | '),

                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text('About', style: Font.boldFont,),
                                                  ListTile(
                                                    title: const Text("Male"),
                                                    onTap: () {

                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  ListTile(
                                                    title: const Text("Female"),
                                                    onTap: () {

                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  ListTile(
                                                    title: const Text("Non-Binary"),
                                                    onTap: () {

                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  ListTile(
                                                    title: const Text("Prefer Not to Answer"),
                                                    onTap: () {

                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );

                                      }
                                    },
                                    child: ProfileCard(profile: profile, index: index),
                                  );
                                },

                                // {
                                //   return ProfileCard(profile: profiles[index], index: index);
                                //   },
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                      
                      
                      
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(screenWidth: screenWidth),
    );
  }
  Widget CategoryItem(BuildContext context, String title) {
    // final provider = Provider.of<CategoryProvider>(context);
    // final isSelected = provider.selectedCategory == title;

    return GestureDetector(
      onTap: () {
        // provider.setSelectedCategory(title);
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          // color: isSelected ? Colors.red : Colors.black54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
