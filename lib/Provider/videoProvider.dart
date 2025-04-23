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
}
