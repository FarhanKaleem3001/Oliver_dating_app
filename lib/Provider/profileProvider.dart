import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier {
  final Map<int, bool> _favoriteStatus = {};

  bool isFavorite(int index) {
    return _favoriteStatus[index] ?? false;
  }

  void toggleFavorite(int index) {
    _favoriteStatus[index] = !(_favoriteStatus[index] ?? false);
    notifyListeners();
  }

  bool _isVisible = false;

  bool get isVisible => _isVisible;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void toggleCheckbox(bool? value) {
    _isChecked = value ?? false;
    notifyListeners();
  }

  String selectedCountry = "BE";
  String phoneNumber = "";

  void setPhoneNumber(String number) {
    phoneNumber = number;
    notifyListeners();
  }

  void setSelectedCountry(String country) {
    selectedCountry = country;
    notifyListeners();
  }

  File? _pickedImage;

  File? get pickedImage => _pickedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _pickedImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _pickedImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  void removeImage() {
    _pickedImage = null;
    notifyListeners();
  }

  List<String> _belgiumCities = [
    "Brussels", "Antwerp", "Ghent", "Charleroi", "Liège",
    "Bruges", "Namur", "Leuven", "Mons", "Mechelen"
  ];

  String? _selectedCity;

  List<String> get belgiumCities => _belgiumCities;
  String? get selectedCity => _selectedCity;

  void setSelectedCity(String city) {
    _selectedCity = city;
    notifyListeners();
  }

  //interest
  final List<String> _selectedChips = [];

  List<String> get selectedChips => _selectedChips;

  bool isSelected(String chip) => _selectedChips.contains(chip);

  void toggleChip(String chip) {
    if (_selectedChips.contains(chip)) {
      _selectedChips.remove(chip);
    } else {
      _selectedChips.add(chip);
    }
    notifyListeners();
  }

  // final List<String> _selectedChips = [];
  String _searchQuery = '';

  final List<String> _allInterests = [
    'Travel', 'Cooking', 'Yoga', 'Gaming', 'Movie', 'Photography',
    'Music', 'Pets', 'Fashion', 'Reading', 'Dancing', 'Art', 'Drawing',
    'Writing', 'Blogging', 'Hiking', 'Cycling', 'Fitness', 'Meditation',
    'Crafting', 'Technology', 'DIY Projects', 'Gardening', 'Board Games',
    'Collecting', 'Skating', 'Swimming', 'Astronomy', 'Karaoke',
    'Language Learning', 'Podcasting', 'Investing', 'Public Speaking',
  ];

  List<String> get filteredInterests {
    if (_searchQuery.isEmpty) return _allInterests;
    return _allInterests
        .where((interest) =>
        interest.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }


  void updateSearchQuery(String query) {
    _searchQuery = query;
    for (final interest in _allInterests) {
      if (interest.toLowerCase() == query.toLowerCase() &&
          !_selectedChips.contains(interest)) {
        _selectedChips.add(interest);
      }
    }

    notifyListeners();
  }

  final Set<int> _favoriteIndexes = {};

  bool isFavorites(int index) => _favoriteIndexes.contains(index);

  void toggleFavorites(int index) {
    if (_favoriteIndexes.contains(index)) {
      _favoriteIndexes.remove(index);
    } else {
      _favoriteIndexes.add(index);
    }
    notifyListeners();
  }


  final List<Map<String, dynamic>> _profiles = [
    {
      'name': 'Monica',
      'age': 24,
      'location': 'Kazan, Russia',
      'image': 'image/girl.jpg'
    },
    {
      'name': 'Lena',
      'age': 26,
      'location': 'Moscow, Russia',
      'image': 'image/girl1.png'
    },
    {
      'name': 'Sara',
      'age': 23,
      'location': 'Berlin, Germany',
      'image': 'image/girl2.png'
    },
    {
      'name': 'Daria',
      'age': 23,
      'location': 'Berlin, Germany',
      'image': 'image/girl3.png'
    },
    {
      'name': 'Alina',
      'age': 23,
      'location': 'Berlin, Germany',
      'image': 'image/girl4.png'
    },


  ];
  List<Map<String, dynamic>> get profiles => _profiles;

}
