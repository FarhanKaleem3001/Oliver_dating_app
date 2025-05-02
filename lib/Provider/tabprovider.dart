import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  final List<String> tabTitles = [
    "About",
    "Gallery",
    "Gift",
    "Forum",
    "Event",
    "Blog",
    "Charity",
  ];

  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;

  void changeTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }
}
