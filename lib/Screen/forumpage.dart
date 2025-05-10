import 'package:dating_site/Profile/forumdetailpage.dart';
import 'package:dating_site/Screen/detailpage.dart';
import 'package:dating_site/Widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modal/ProfileData.dart';
import '../Provider/profileProvider.dart';
import '../Utils/color.dart';
import '../Widget/custombottomnavbar.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final imageList = [
      'image/f1.png',
      'image/f2.png',
      'image/f3.png',
      'image/f4.png',
      'image/f5.png',
      'image/f6.png',
    ];

    final favoriteProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Header(),
                  const SizedBox(height: 10),
                ],
              ),
            ),


            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final isFav = favoriteProvider.isFavorite(index);
                  final profileImage = imageList[index % imageList.length];

                  return Card(
                    elevation: 8,
                    shadowColor: Colors.black.withOpacity(0.5),
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    // color: Colors.white,
                    // margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    //
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              profileImage,
                              height: 130,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForumDetailPage(
                                          name: profiles[index]['name'],
                                          description: '',
                                          profile: {},
                                          index: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Flourish Fest: Where Women and Wildflowers Rise Together..',
                                      style: Font.boldFont4,
                                    ),
                                  ),
                                ),
                                Text(
                                  'I am a professional website developer and designer...',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Font.normalFont6,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForumDetailPage(
                                          name: profiles[index]['name'],
                                          description:
                                          'I am a professional website developer and designer, having good knowledge of different web programming languages. ' * 3,
                                          profile: {},
                                          index: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    '...Read more',
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => favoriteProvider.toggleFavorite(index),
                                      child: Icon(
                                        isFav ? Icons.favorite : Icons.favorite_border,
                                        color: isFav ? Colors.red : Colors.black87,
                                        size: 25,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text('30'),
                                    const SizedBox(width: 15),
                                    const Icon(Icons.message, size: 20),
                                    const SizedBox(width: 5),
                                    const Text('10'),
                                    const SizedBox(width: 15),
                                    Image.asset('image/seen.png', height: 20, width: 20),
                                    const SizedBox(width: 5),
                                    const Text('50'),
                                  ],
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(screenWidth: screenWidth),
    );
  }

}
