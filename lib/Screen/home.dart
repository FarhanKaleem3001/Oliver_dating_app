import 'package:flutter/material.dart';

import '../Utils/color.dart';
import '../Widget/custombottomnavbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.message_rounded,
                      ),
                      Spacer(),
                      Text(
                        'MIX OF COLOR',
                        style: Font.boldFont,
                      ),
                      Spacer(),
                      Icon(Icons.notifications),
                      Icon(Icons.filter_list),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          offset: Offset(0, 8), // bottom shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          Image.asset(
                            'image/girl.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 140,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 120,
                            child: Text(
                              'Monica (24)',
                              style: Font.profilename,
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 100,
                            child: Text(
                              '5 km away',
                              style: Font.profileadd,
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 20,
                            right: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.green, width: 2),
                                    ),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.transparent,
                                      child: Icon(Icons.refresh, color: Colors.green, size: 30),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.red, width: 2),
                                    ),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.transparent,
                                      child: Icon(Icons.close, color: Colors.red, size: 30),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.orangeAccent, width: 2),
                                    ),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.transparent,
                                      child: Icon(Icons.star, color: Colors.orangeAccent, size: 30),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.purple, width: 2),
                                    ),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.transparent,
                                      child: Icon(Icons.favorite, color: Colors.purple, size: 30),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.blue, width: 2),
                                    ),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.transparent,
                                      child: Icon(Icons.location_on, color: Colors.blue, size: 30),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
,
                  SizedBox(height: 5,),

                ],
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: CustomBottomNavBar(screenWidth: screenWidth),
    );
  }
}
