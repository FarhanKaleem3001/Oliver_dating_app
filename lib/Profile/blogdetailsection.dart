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
import '../Widget/appbar.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.all(20),
              child: Header(),
            ),




            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How to Cultivate Creativity: Tips to Unleash Your Inner Artist',
                      style: Font.boldFont,
                    ),
                    SizedBox(height: 20),

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

                    SizedBox(height: 20),

                    Text(
                      'About Blog',
                      style: TextStyle(fontSize: 18, color: login, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 8),

                    Text(
                      widget.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(screenWidth: screenWidth),
    );
  }

}
