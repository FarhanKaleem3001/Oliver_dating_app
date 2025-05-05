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

  bool _isPictureSelected = true;

  bool get isPictureSelected => _isPictureSelected;

  void selectPicture() {
    _isPictureSelected = true;
    notifyListeners();
  }

  void selectVideo() {
    _isPictureSelected = false;
    notifyListeners();
  }

//status
  String? _status;

  String? get status => _status;

  void setStatus(String value) {
    _status = value;
    notifyListeners();
  }

  void clearStatus() {
    _status = null;
    notifyListeners();
  }
}
