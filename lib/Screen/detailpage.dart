import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../Provider/locationProvider.dart';
import '../Provider/profileProvider.dart';
import '../Utils/color.dart';

class DetailPage extends StatefulWidget {
  final String description;
  const DetailPage({super.key, required this.description});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
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
                          child: Image.asset('image/profile.jpg',
                              width: 40, height: 40)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sahil Gaur',
                          style: Font.normalFont,
                        ),
                        Row(
                          children: [
                            Text(
                              'UK, London',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,),
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
                              DateFormat('dd-MM-yyyy').format(DateTime.now()),
                              style: TextStyle(fontSize: 10, color: hintcolor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                //Image.asset('image/img1.jpg'),
                SizedBox(height: 20,),
              Text('This is Heading', style: Font.boldFont),
                SizedBox(height: 20,),
                CarouselSlider(
                  items: [
                    Image.asset('image/img1.jpg', fit: BoxFit.cover),
                    Image.asset('image/img2.jpg', fit: BoxFit.cover),
                    Image.asset('image/img3.jpg', fit: BoxFit.cover),
          
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
        ));
  }
}
