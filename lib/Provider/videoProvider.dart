// lib/Provider/video_provider.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier {
  late VideoPlayerController _controller;

  VideoPlayerController get controller => _controller;

  Future<void> initializeVideo() async {
    _controller = VideoPlayerController.asset('image/vdio.mp4');
    await _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(0);
    await _controller.play();
    notifyListeners();
  }

  void disposeController() {
    _controller.dispose();
  }


//
  late VideoPlayerController _controllers;
  bool _isInitialized = false;

  VideoPlayerController get controllers => _controllers;
  bool get isInitialized => _isInitialized;

  void initialize(String assetPath) {
    _controller = VideoPlayerController.asset(assetPath)
      ..initialize().then((_) {
        _isInitialized = true;
        notifyListeners();
      });
  }

  void disposeControllers() {
    if (_isInitialized) {
      _controller.dispose();
      _isInitialized = false;
    }
  }
//gif
  List<String> mediaList = [];
  int selectedIndex = 0;

  void setMedia(List<String> list, int index) {
  mediaList = list;
  selectedIndex = index;
  notifyListeners();
  }

  //image
  List<String> imageList = [];
  int currentIndex = 0;

  void setImages(List<String> images, int index) {
    imageList = images;
    currentIndex = index;
    notifyListeners();
  }

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

}

