
import 'package:dating_site/Modal/ProfileData.dart';
import 'package:dating_site/Provider/profileProvider.dart';
import 'package:dating_site/Screen/profilecard.dart';
import 'package:dating_site/Screen/profilecarddetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

import '../Modal/ProfileData.dart';
import '../Utils/color.dart';
import '../Widget/appbar.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Header(),

                    SizedBox(height: 20),
                    SafeArea(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SafeArea(
                            child: SizedBox(
                              height: 650,
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: CardSwiper(
                                    cardsCount: profiles.length,
                                    onSwipe: (prevIndex, currentIndex, direction) => true,
                                    cardBuilder: (
                                        BuildContext context,
                                        int index,
                                        int horizontalOffsetPercentage,
                                        int verticalOffsetPercentage,
                                        ) {
                                      final profile = profiles[index];
                                      return ProfileCard(profile: profile, index: index);
                                    },
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )

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

    return GestureDetector(
      onTap: () {
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
