import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating_site/Provider/tabprovider.dart';
import 'package:dating_site/Widget/custombottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../Provider/locationProvider.dart';
import '../Provider/profileProvider.dart';
import '../Utils/color.dart';

class EventDetailPage extends StatefulWidget {
  final Map<String, dynamic> profile;
  final int index;
  final String name;
  final String description;
  const EventDetailPage(
      {super.key,
        required this.description,
        required this.profile,
        required this.index,
        required this.name});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool showOptions = false;
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    final profiles = Provider.of<ProfileProvider>(context).profiles;
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.favorite, color: Colors.red,),
                                //Image.asset('image/heart.png', height: 20, width: 20,),
                                SizedBox(width: 5),
                                Text('MIX OF COLOR', style: Font.boldFont),
                              ],
                            ),
                            Spacer(),
                            Image.asset('image/bell.png', height: 20,width: 20,),
                            SizedBox(width: 10),
                            Image.asset('image/filter.png', height: 20,width: 20,),

                          ],
                        ),
                        SizedBox(height: 20),
                        SingleChildScrollView(
                          child: Center(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 15,
                                            child: ClipOval(
                                                child: Image.asset('image/abt5.jpg',
                                                    width: 40, height: 40)),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              //Text('${widget.profile['name']}', style: Font.normalFont),
                                              Text('Monica', style: Font.normalFont),

                                              Row(
                                                children: [
                                                  Text(
                                                    'Kazan, Russia',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    'Posted on: ',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 12,
                                                        color: Colors.green),
                                                  ),
                                                  Text(
                                                    DateFormat('dd-MM-yyyy')
                                                        .format(DateTime.now()),
                                                    style: TextStyle(
                                                        fontSize: 10, color: hintcolor),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      //Image.asset('image/img1.jpg'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('Electric Dreams: A Neon Glow-in-the-Dark Dance Experience', style: Font.boldFont),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        children: [
                                          Center(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image.asset(
                                                'image/ev6.png',
                                                width: 380,
                                                height: 400,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // CarouselSlider(
                                      //   items: [
                                      //     Image.asset('image/ev6.png',
                                      //         fit: BoxFit.cover),
                                      //     Image.asset('image/ev5.png',
                                      //         fit: BoxFit.cover),
                                      //     Image.asset('image/ev4.png',
                                      //         fit: BoxFit.cover),
                                      //   ],
                                      //   options: CarouselOptions(
                                      //     height: 500,
                                      //     autoPlay: true,
                                      //     autoPlayInterval: Duration(seconds: 2),
                                      //     enlargeCenterPage: true,
                                      //     aspectRatio: 16 / 9,
                                      //     viewportFraction: 0.8,
                                      //   ),
                                      // ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          //Image.asset('image/Cal.png'),
                                          Icon(Icons.calendar_month_outlined, color: Colors.black54, size: 18,),
                                          SizedBox(width: 5),
                                          Text('Dec 12, 2025', style: TextStyle(fontSize: 12, color: hintcolor, fontWeight: FontWeight.bold),),
                                          SizedBox(width: 15),
                                          Icon(Icons.watch_later_outlined, color: Colors.black54,size: 18,),
                                          SizedBox(width: 5),
                                          Text('08:07Am',style: TextStyle(fontSize: 12, color: hintcolor, fontWeight: FontWeight.bold),),
                                          SizedBox(width: 15),
                                          Image.asset('image/wine.png', color: login,),
                                          SizedBox(width: 5),
                                  Consumer<TabProvider>(
                                    builder: (context, statusProvider, child) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Are you coming${statusProvider.status != null ? ' - ${statusProvider.status}' : ''}',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: login,
                                                ),
                                              ),
                                              const SizedBox(width: 5),


                                              const Icon(Icons.arrow_drop_down, color:login),
                                            ],
                                          ),

                                        ],
                                      );
                                    },
                                  ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'image/loc.png',
                                            height: 20,
                                            width: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          Expanded(
                                            child: Text(
                                              'Westbrook Heights Avenue, Apartment 12D, Silver Oak Residences, Near Evergreen Park, Sector 24, Green Valley, Redwood County, California, 98765, USA',
                                              style: TextStyle(fontSize: 12, color: hintcolor, fontWeight: FontWeight.bold),
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 20),
                                      Text('About Event',  style: TextStyle(fontSize: 18, color: login, fontWeight: FontWeight.bold),),
                                      Text(
                                        widget.description,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      bottomNavigationBar: CustomBottomNavBar(screenWidth: screenWidth),
    );
  }
}
