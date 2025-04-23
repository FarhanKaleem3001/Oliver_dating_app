import 'package:dating_site/Screen/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/navigationProvider.dart';
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
            MaterialPageRoute(builder: (context) => Home()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LandingPage()),
          );
        }
      },
      selectedItemColor: login,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 40,), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.star, size: 40,), label: 'Matches'),
        BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded,size: 40,), label: 'Chats',),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded, size: 40,), label: 'Profile'),
      ],
    );
  }
}
