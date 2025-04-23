

import 'dart:ui';

import 'package:dating_site/Provider/profileProvider.dart';
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


          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign In", style: Font.boldFont3),
                        SizedBox(height: 10),
                        Text('If you don’t have an account register.', style: Font.normalFont5),
                        Row(
                          children: [
                            Text('You can ', style: Font.normalFont5),
                            Text(' Register here ! ', style: TextStyle(color: login, fontSize: 15, fontWeight: FontWeight.bold)),
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
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Enter Your Email",
                            hintStyle: TextStyle(color: Colors.white70),
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
                              style: TextStyle(color: Colors.white),
                              obscureText: !passwordProvider.isVisible,
                              decoration: InputDecoration(
                                hintText: "  Enter Your Password",
                                hintStyle: TextStyle(color: Colors.white70),
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
                                    Text('Remember me', style: Font.normalFont5),
                                  ],
                                );
                              },
                            ),
                            Text('Forgot Password?', style: Font.normalFont5),
                          ],
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: login,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text("LOGIN", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20)),
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
