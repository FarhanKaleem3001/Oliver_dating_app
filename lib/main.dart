import 'package:dating_site/Provider/locationProvider.dart';
import 'package:dating_site/Provider/profileProvider.dart';
import 'package:dating_site/Provider/videoProvider.dart';
import 'package:dating_site/Screen/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/navigationProvider.dart';
import 'Screen/signin.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ProfileProvider()),
        ChangeNotifierProvider(create: (_)=>LocationProvider()),
        ChangeNotifierProvider(create: (_)=>VideoProvider()),
        ChangeNotifierProvider(create: (_)=>NavigationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home: const SignIn(),
       // home: const LandingPage(),
      ),
    );
  }
}

