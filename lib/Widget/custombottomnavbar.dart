import 'package:dating_site/Screen/blogpage.dart';
import 'package:dating_site/Screen/eventpage.dart';
import 'package:dating_site/Screen/forumpage.dart';
import 'package:dating_site/Screen/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/navigationProvider.dart';
import '../Screen/charitypage.dart';
import '../Screen/detailpage.dart';
import '../Screen/home.dart';
import '../Utils/color.dart';

class CustomBottomNavBar extends StatelessWidget {
  final double screenWidth;

  const CustomBottomNavBar({Key? key, required this.screenWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    if (screenWidth > 500) return SizedBox.shrink();

    return BottomNavigationBar(
      currentIndex: navigationProvider.selectedIndex,
      onTap: (index) {
        navigationProvider.setIndex(index);
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                      profile: {},
                      index: index,
                    )),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ForumPage(

                    )),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventPage(

                    )),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlogPage(

                )),
          );
        }
        else if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CharityPage()),
          );
        }
      },
      selectedItemColor: login,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            navigationProvider.selectedIndex == 0
                ? 'image/home-2.png'
                : 'image/home-3.png',
            width: 24,
            height: 24,
          ),
          label: 'Home',
        ),

        BottomNavigationBarItem(
            icon: Image.asset(
              navigationProvider.selectedIndex == 1
                  ? 'image/send-2 (1).png'
                  : 'image/send-2.png',
              width: 24,
              height: 24,
            ),
            label: 'Forum'),
        BottomNavigationBarItem(
          icon: Image.asset(
            navigationProvider.selectedIndex == 2
                ? 'image/calendar (1).png'
                : 'image/calendar.png',
            width: 24,
            height: 24,
          ),
          label: 'Events',
        ),
        BottomNavigationBarItem(
            icon: Image.asset(
              navigationProvider.selectedIndex == 3
                  ? 'image/voice-square.png'
                  : 'image/Chat.png',
              width: 24,
              height: 24,
            ),
            label: 'Blog'),
        BottomNavigationBarItem(
            icon: Image.asset(
              navigationProvider.selectedIndex == 4
                  ? 'image/charity4.png'
                  : 'image/charity3.png',
              width: 24,
              height: 24,
            ),
            label: 'Charity'),
      ],
    );
  }
}
