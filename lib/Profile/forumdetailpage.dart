import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../Provider/locationProvider.dart';
import '../Provider/profileProvider.dart';
import '../Utils/color.dart';

class ForumDetailPage extends StatefulWidget {
  final Map<String, dynamic> profile;
  final int index;
  final String name;
  final String description;
  const ForumDetailPage(
      {super.key,
        required this.description,
        required this.profile,
        required this.index,
        required this.name});

  @override
  State<ForumDetailPage> createState() => _ForumDetailPageState();
}

class _ForumDetailPageState extends State<ForumDetailPage> {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    final profiles = Provider.of<ProfileProvider>(context).profiles;
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  //Image.asset('image/heart.png', height: 20, width: 20,),
                  SizedBox(width: 5),
                  Text('MIX OF COLOR', style: Font.boldFont),
                ],
              ),
              Spacer(),
              Image.asset(
                'image/bell.png',
                height: 20,
                width: 20,
              ),
              SizedBox(width: 10),
              Image.asset(
                'image/filter.png',
                height: 20,
                width: 20,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
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
                            Text('Flourish Fest: Where Women and Wildflowers Rise Together', style: Font.boldFont),
                            SizedBox(
                              height: 20,
                            ),
                            CarouselSlider(
                              items: [
                                Image.asset('image/f1.png',
                                    fit: BoxFit.cover),
                                Image.asset('image/f2.png',
                                    fit: BoxFit.cover),
                                Image.asset('image/f3.png',
                                    fit: BoxFit.cover),
                              ],
                              options: CarouselOptions(
                                height: 500,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 2),
                                enlargeCenterPage: true,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              widget.description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
