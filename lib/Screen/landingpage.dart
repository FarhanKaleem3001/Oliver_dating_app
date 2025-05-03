
import 'dart:math';

import 'package:dating_site/Provider/profileProvider.dart';
import 'package:dating_site/Screen/detailpage.dart';
import 'package:dating_site/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../Modal/ProfileData.dart';
import '../Provider/navigationProvider.dart';
import '../Utils/color.dart';
import '../Widget/custombottomnavbar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final favoriteStatus = Provider.of<ProfileProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mix of Color'),
      ),
     // drawer: SideBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 25,
                      child: ClipOval(
                        child: Image.asset(
                          'image/profile.jpg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "What's on your mind...",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.black54, width: 1),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: login,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Create Post',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  final favoriteProvider = Provider.of<ProfileProvider>(context);
                  final isFav = favoriteProvider.isFavorite(index);

                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    //elevation: 1,

                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 1),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'image/img1.jpg',
                                      width: 120,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(description: '', profile: {}, index: index,    name: profiles[index]['name'],)));
                                      },
                                        child: Text('This is Heading', style: Font.boldFont)),
                                    Text(
                                      'I am a professional website developer and designer, having good knowledge of different web programming languages.',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Font.normalFont,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailPage(
                                              description: 'I am a professional website developer and designer, having good knowledge of different web programming languages. I am a professional website developer and designer, having good knowledge of different web programming languages. I am a professional website developer and designer, having good knowledge of different web programming languages. I am a professional website developer and designer, having good knowledge of different web programming languages. I am a professional website developer and designer, having good knowledge of different web programming languages. I am a professional website developer and designer, having good knowledge of different web programming languages.', profile: {}, index: index,    name: profiles[index]['name'],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        '...Read more',
                                        style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                                      ),
                                    ),


                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            favoriteProvider.toggleFavorite(index);
                                          },
                                          child: Icon(
                                            isFav ? Icons.favorite : Icons.favorite_border,
                                            color: isFav ? Colors.red : Colors.black87,
                                            size: 25,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text('30'),
                                        const SizedBox(width: 15),
                                        const Icon(Icons.message, size: 20),
                                        SizedBox(width: 5),
                                        Text('10'),
                                        const SizedBox(width: 15),
                                        Image.asset('image/seen.png', height: 20, width: 20),
                                        SizedBox(width: 5),
                                        Text('50'),
                                      ],
                                    ),
                                  SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 15,
                                          child: ClipOval(child: Image.asset('image/profile.jpg', width: 40, height: 40)),
                                        ),
                                        SizedBox(width: 5,),
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
                                                  'Posted on: ',
                                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.green),
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
                                  ],
                                ),
                              ),
                            ],
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
