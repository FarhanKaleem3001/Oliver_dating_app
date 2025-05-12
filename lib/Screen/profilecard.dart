import 'package:dating_site/Screen/profiledetailscreen.dart';
import 'package:dating_site/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/profileProvider.dart';



class ProfileCard extends StatelessWidget {
  final Map<String, dynamic> profile;
  final int index;

  const ProfileCard({required this.profile, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProfileDetailScreen(profile: profile, index: index),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Image.asset(
                profile['image'],
               fit: BoxFit.cover,
                width: double.infinity,
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
                bottom: 80,
                child: Row(
                  children: [
                    Text(
                      '${profile['name']} (${profile['age']})',
                      style: Font.profilename1,
                    ),
                    const SizedBox(width: 8),
                    Consumer<ProfileProvider>(
                      builder: (context, profileProvider, child) {
                        final isFollowing = profileProvider.isFollowing(index);

                        return GestureDetector(
                          onTap: () {
                            profileProvider.toggleFollow(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isFollowing ? login : Colors.transparent,
                              border: Border.all(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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

                    Container(
                      width: 50,
                      height: 50,
                      child: Consumer<ProfileProvider>(
                        builder: (context, profileProvider, child) {
                          final isFav = profileProvider.isFavorites(index);
                          return GestureDetector(
                            onTap: () {
                              profileProvider.toggleFavorites(index);
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.transparent,
                              child: Icon(
                                Icons.favorite,
                                color: isFav ? Colors.red : Colors.white,
                                size: 30,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 10,
                bottom: 60,
                child: Text(profile['location'], style: Font.profileadd),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
