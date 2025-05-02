import 'package:dating_site/Provider/locationProvider.dart';
import 'package:dating_site/Provider/profileProvider.dart';
import 'package:dating_site/Provider/videoProvider.dart';
import 'package:dating_site/Screen/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/navigationProvider.dart';
import 'Provider/tabprovider.dart';
import 'Screen/signin.dart';


void main() {
  runApp(MyApp(index: 0, profile: {},));
}


class MyApp extends StatelessWidget {
  final Map<String, dynamic> profile;
  final int index;
  const MyApp({required this.profile, required this.index});



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ProfileProvider()),
        ChangeNotifierProvider(create: (_)=>LocationProvider()),
        ChangeNotifierProvider(create: (_)=>VideoProvider()),
        ChangeNotifierProvider(create: (_)=>NavigationProvider()),
        ChangeNotifierProvider(create: (_)=>TabProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home: SignIn(profile: const {}, index: index,),
       // home: const LandingPage(),
      ),
    );
  }
}

