

import 'package:flutter/material.dart';

class ProfileCardDetail extends StatefulWidget {
  final Map<String, dynamic> profile;
  const ProfileCardDetail({required this.profile,super.key});

  @override
  State<ProfileCardDetail> createState() => _ProfileCardDetailState();
}

class _ProfileCardDetailState extends State<ProfileCardDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          flex: 6,
          child: Container(
            decoration: const BoxDecoration(

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign in to continue",

                    ),
                    const SizedBox(height: 20),



                    const SizedBox(height: 10),
                    Center(
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Text(
                          "Don't have an account? Sign Up",

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
