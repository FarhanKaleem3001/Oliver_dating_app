

import 'package:dating_site/Profile/eventdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modal/ProfileData.dart';
import '../Provider/profileProvider.dart';
import '../Screen/detailpage.dart';
import '../Utils/color.dart';
import '../Widget/appbar.dart';
import '../Widget/custombottomnavbar.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final imageList = [
      'image/e1.png',
      'image/e2.png',
      'image/e3.png',
      'image/e4.png',
      'image/e5.png',
      'image/e6.png',
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
                                        builder: (context) => EventDetailPage(description: '', profile: {}, index: index,    name: profiles[index]['name'],),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text('Electric Dreams: A Neon Glow-in-the-Dark Dance Experience...', style: Font.boldFont4),
                                  ),
                                ),
                                Text(
                                  'Join us for a magical night where music fills the air and memories are made under the stars. Let the rhythm guide you into a journey of joy, connection, and celebration',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Font.normalFont6,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EventDetailPage(
                                          name: profiles[index]['name'],
                                          description:
                                          'Join us for a magical night where music fills the air and memories are made under the stars. This unforgettable evening will feature live bands and DJ sets playing everything from soulful tunes to high-energy dance tracks, all set in a beautiful open-air venue perfect for stargazing and soaking in the vibe.' *
                                              1, profile: {}, index: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    '...Read more',
                                    style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    //Image.asset('image/Cal.png'),
                                    Icon(Icons.calendar_month_outlined, color: Colors.black54, size: 18,),
                                    SizedBox(width: 5),
                                    Text('Dec 12, 2025', style: TextStyle(fontSize: 12),),
                                    SizedBox(width: 10),
                                    Icon(Icons.watch_later_outlined, color: Colors.black54,size: 18,),
                                    SizedBox(width: 5),
                                    Text('08:07Am',style: TextStyle(fontSize: 12),),
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
