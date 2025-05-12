import 'package:dating_site/Provider/videoProvider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:dating_site/Utils/color.dart';
import 'package:video_player/video_player.dart';

import '../Provider/tabprovider.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: tabProvider.selectPicture,
                child: Row(
                  children: [
                    Image.asset('image/pic.png',  color: tabProvider.isPictureSelected
                        ? login
                        : Colors.black,),
                    const SizedBox(width: 5),
                    Text(
                      "Picture",
                      style: TextStyle(
                        color: tabProvider.isPictureSelected
                            ? login
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 80),
              GestureDetector(
                onTap: tabProvider.selectVideo,
                child: Row(
                  children: [
                    Image.asset(
                      'image/vido.png',
                      color: tabProvider.isPictureSelected ? Colors.black : login,
                    ),

                    const SizedBox(width: 5),
                    Text(
                      "Video",
                      style: TextStyle(
                        color: !tabProvider.isPictureSelected
                            ? login
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          tabProvider.isPictureSelected
              ? const PictureWidget()
              : const VideoWidget(),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

//img
class PictureWidget extends StatelessWidget {
  const PictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final imageList = [
      'image/abt1.jpg',
      'image/abt2.jpg',
      'image/abt3.jpg',
      'image/abt4.jpg',
      'image/abt5.jpg',
      'image/abt1.jpg',
      'image/abt2.jpg',
      'image/abt3.jpg',
      'image/abt1.jpg',
      'image/abt2.jpg',
      'image/abt3.jpg',
      'image/abt4.jpg',
      'image/abt5.jpg',
      'image/abt1.jpg',
      'image/abt2.jpg',
      'image/abt3.jpg',
      'image/abt1.jpg',
      'image/abt2.jpg',
      'image/abt3.jpg',
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.65,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(imageList.length, (index) {
          return GestureDetector(
            onTap: () {
              context.read<VideoProvider>().setImages(imageList, index);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FullScreenImageViewer(),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.asset(imageList[index], fit: BoxFit.cover),
            ),
          );
        }),
      ),
    );
  }
}

class FullScreenImageViewer extends StatefulWidget {
  const FullScreenImageViewer({super.key});

  @override
  State<FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    final provider = context.read<VideoProvider>();
    _pageController = PageController(initialPage: provider.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final mediaProvider = context.watch<VideoProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Image ${mediaProvider.currentIndex + 1} / ${mediaProvider.imageList.length}',
        ),
        foregroundColor: Colors.white,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: mediaProvider.imageList.length,
        onPageChanged: (index) => mediaProvider.updateIndex(index),
        itemBuilder: (context, index) {
          return PhotoView(
            imageProvider: AssetImage(mediaProvider.imageList[index]),
            backgroundDecoration: const BoxDecoration(color: Colors.black),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

//vdio
class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final gifList = [
      'image/sun.gif',
      'image/i1.gif',
      'image/i2.gif',
      'image/i3.gif',
      'image/i4.gif',
      'image/dog.gif',
      'image/cat.gif',
      'image/sun.gif',
      'image/sun.gif',
      'image/i1.gif',
      'image/i2.gif',
      'image/i3.gif',
      'image/i4.gif',
      'image/dog.gif',
      'image/cat.gif',
      'image/sun.gif',
      'image/i4.gif',
      'image/dog.gif',
      'image/cat.gif',
      'image/sun.gif',
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.65,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(gifList.length, (index) {
          return GestureDetector(
            onTap: () {
              context.read<VideoProvider>().setMedia(gifList, index);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FullScreenGifViewer()),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.asset(gifList[index], fit: BoxFit.cover),
            ),
          );
        }),
      ),
    );
  }
}

class FullScreenGifViewer extends StatefulWidget {
  const FullScreenGifViewer({super.key});

  @override
  State<FullScreenGifViewer> createState() => _FullScreenGifViewerState();
}

class _FullScreenGifViewerState extends State<FullScreenGifViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    final provider = context.read<VideoProvider>();
    _pageController = PageController(initialPage: provider.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<VideoProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
            'Video ${provider.selectedIndex + 1} / ${provider.mediaList.length}'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: provider.mediaList.length,
        onPageChanged: (index) {
          provider.setMedia(provider.mediaList, index);
        },
        itemBuilder: (context, index) {
          return Center(
            child: Image.asset(provider.mediaList[index]),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
