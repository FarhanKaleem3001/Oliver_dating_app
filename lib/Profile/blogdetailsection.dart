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

class BlogDetailSection extends StatefulWidget {
  final Map<String, dynamic> profile;
  final int index;
  final String name;
  final String description;
  const BlogDetailSection(
      {super.key,
        required this.description,
        required this.profile,
        required this.index,
        required this.name});

  @override
  State<BlogDetailSection> createState() => _BlogDetailSectionState();
}

class _BlogDetailSectionState extends State<BlogDetailSection> {
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
                                    Text('How to Cultivate Creativity: Tips to Unleash Your Inner Artist', style: Font.boldFont),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Center(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Image.asset(
                                              'image/bv1.png',
                                              width: 380,
                                              height: 400,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),




                                    SizedBox(height: 20),
                                    Text('About Blog',  style: TextStyle(fontSize: 18, color: login, fontWeight: FontWeight.bold),),
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
