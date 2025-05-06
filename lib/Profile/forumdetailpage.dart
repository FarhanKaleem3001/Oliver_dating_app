import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating_site/Widget/custombottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../Provider/locationProvider.dart';
import '../Provider/profileProvider.dart';
import '../Utils/color.dart';
import '../Widget/appbar.dart';

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
      
        body: SafeArea(
         child: SingleChildScrollView(
           child: Column(
             children: [
             Padding(
               padding: EdgeInsets.all(20),
               child: Center(
                 child: Column(
                   children: [

                     SizedBox(height: 20),
                     SingleChildScrollView(
                       child: Center(
                         child: Column(
                           children: [
                             SingleChildScrollView(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Header(),
                                   //Image.asset('image/img1.jpg'),
                                   SizedBox(
                                     height: 20,
                                   ),
                                   Text('Flourish Fest: Where Women and Wildflowers Rise Together', style: Font.boldFont),
                                   SizedBox(
                                     height: 20,
                                   ),
                                   Column(
                                     children: [
                                       Center(
                                         child: ClipRRect(
                                           borderRadius: BorderRadius.circular(20),
                                           child: Image.asset(
                                             'image/fo4.png',
                                             width: 380,
                                             height: 400,
                                             fit: BoxFit.cover,
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                   SizedBox(height: 10,),
                                   Row(
                                     children: [
                                       Row(
                                         children: [
                                           Consumer<ProfileProvider>(
                                             builder: (context, profileProvider, child) {
                                               final isFav = profileProvider.isFavoritess;
                                               return GestureDetector(
                                                 onTap: () {
                                                   profileProvider.toggleFavoritess();
                                                 },
                                                 child: Icon(
                                                   isFav ? Icons.favorite : Icons.favorite_border,
                                                   color: isFav ? Colors.red : Colors.black87,
                                                   size: 30,
                                                 ),
                                               );
                                             },
                                           ),
                                           SizedBox(width: 5,),
                                           Text('Like', style: Font.profileabout3)
                                         ],
                                       ),
                                       SizedBox(width: 20,),
                                       Row(
                                         children: [
                                           Consumer<ProfileProvider>(
                                             builder: (context, profileProvider, child) {
                                               final isFav = profileProvider.isFavoritess;
                                               return GestureDetector(
                                                 onTap: () {
                                                   profileProvider.toggleFavoritess();
                                                 },
                                                 child: Icon(
                                                 Icons.chat_outlined,
                                                   size: 25,
                                                 ),
                                               );
                                             },
                                           ),SizedBox(width: 5,),
                                           Text('Replies', style: Font.profileabout3)
                                         ],
                                       ),
                                     ],
                                   ),
                                   SizedBox(height: 10,),
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
