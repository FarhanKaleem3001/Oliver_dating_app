

import 'dart:ui';

import 'package:dating_site/Provider/profileProvider.dart';
import 'package:dating_site/Screen/home.dart';
import 'package:dating_site/Screen/landingpage.dart';
import 'package:dating_site/Screen/signup.dart';
import 'package:dating_site/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../Provider/videoProvider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final videoProvider = Provider.of<VideoProvider>(context, listen: false);
    videoProvider.initializeVideo();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Consumer<VideoProvider>(
            builder: (context, provider, _) {
              return provider.controller.value.isInitialized
                  ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: provider.controller.value.size.width,
                    height: provider.controller.value.size.height,
                    child: VideoPlayer(provider.controller),
                  ),
                ),
              )
                  : const SizedBox();
            },
          ),
         

          Padding(
            padding: const EdgeInsets.only(top: 320),
            child: Expanded(
              flex: 6,
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign In", style: Font.boldFont1),
                        SizedBox(height: 10),
                        Text('If you don’t have an account register.', style: Font.normalFont),
                        Row(
                          children: [
                            Text('You can ', style: Font.normalFont),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                              },
                                child: Text(' Register here ! ', style: TextStyle(color: login, fontSize: 15, fontWeight: FontWeight.bold))),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.mail_outline_rounded, color: login),
                            SizedBox(width: 5),
                            Text('Email', style: TextStyle(color: login, fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: emailController,
                          style: TextStyle(color: category),
                          decoration: InputDecoration(
                            hintText: "Enter Your Email",
                            hintStyle: TextStyle(color: hintcolor),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: login),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.lock_outline, color: login),
                            SizedBox(width: 5),
                            Text('Password', style: TextStyle(color: login, fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Consumer<ProfileProvider>(
                          builder: (context, passwordProvider, child) {
                            return TextField(
                              controller: passwordController,
                              style: TextStyle(color: category),
                              obscureText: !passwordProvider.isVisible,
                              decoration: InputDecoration(
                                hintText: "Enter Your Password",
                                hintStyle: TextStyle(color: hintcolor),
                                border: const UnderlineInputBorder(),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: login),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordProvider.isVisible ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: passwordProvider.toggleVisibility,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Consumer<ProfileProvider>(
                              builder: (context, rememberProvider, child) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      value: rememberProvider.isChecked,
                                      onChanged: rememberProvider.toggleCheckbox,
                                      activeColor: login,
                                    ),
                                    Text('Remember me', style: TextStyle(color: login, fontSize: 15, fontWeight: FontWeight.w400)),
                                  ],
                                );
                              },
                            ),
                            Text('Forgot Password?', style: TextStyle(color: login, fontSize: 15, fontWeight: FontWeight.w400)),
                          ],
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: login,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text("LOGIN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
