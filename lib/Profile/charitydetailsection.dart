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

class CharityDetailSection extends StatefulWidget {
  final Map<String, dynamic> profile;
  final int index;
  final String name;
  final String description;
  const CharityDetailSection(
      {super.key,
        required this.description,
        required this.profile,
        required this.index,
        required this.name});

  @override
  State<CharityDetailSection> createState() => _CharityDetailSectionState();
}

class _CharityDetailSectionState extends State<CharityDetailSection> {
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
                    SizedBox(height: 20),
                    Text(
                      'Building a Solar-Powered School in a Rural Village.',
                      style: Font.boldFont,
                    ),
                    SizedBox(height: 20),

                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'image/cv1.png',
                          width: 380,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Fund Required', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text('\$700', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('Feb 05,2025', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('(25 days left)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: 0.55,
                            minHeight: 8,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(login),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '55%',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),


                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: btcolor,
                              padding:
                              const EdgeInsets.symmetric(vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "\$10",
                              style: TextStyle(
                                  color: notcolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: btcolor,
                              padding:
                              const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "\$10",
                              style: TextStyle(
                                  color: notcolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: btcolor,
                              padding:
                              const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "\$10",
                              style: TextStyle(
                                  color: notcolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: btcolor,
                              padding:
                              const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "\$10",
                              style: TextStyle(
                                  color: notcolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: donatcolor,
                              padding:
                              const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Donate",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),

                      ],
                    ),



                SizedBox(height: 20),


                    Text(
                      'About Charity',
                      style: TextStyle(fontSize: 18, color: login, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
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
