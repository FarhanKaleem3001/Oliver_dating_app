import 'package:dating_site/Provider/profileProvider.dart';
import 'package:dating_site/Screen/landingpage.dart';
import 'package:dating_site/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpFinal extends StatefulWidget {
  const SignUpFinal({super.key});

  @override
  State<SignUpFinal> createState() => _SignUpFinalState();
}

class _SignUpFinalState extends State<SignUpFinal> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey.shade200,
                        child: Text(
                          '1',
                          style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                        ),
                      ),


                      Container(
                        width: 100,
                        height: 4,
                        color: Colors.grey.shade300,
                      ),


                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey.shade200,
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                        ),
                      ),


                      Container(
                        width: 100,
                        height: 6,
                        color: login,
                      ),


                      CircleAvatar(
                        radius: 20,
                        backgroundColor: login,
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Interested In", style: Font.boldFont1),
                  const SizedBox(height: 20),
                  //Center(child: Image.asset('image/profile.jpg', height: 100,)),
                  Text(
                    'Share your interest, passions and hobbies. We will connect you with people who share your enthusiasm',
                    style: Font.normalFont,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: searchController,
                    onChanged: (value) {
                      Provider.of<ProfileProvider>(context, listen: false)
                          .updateSearchQuery(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search Interest...",
                      hintStyle: TextStyle(color: hintcolor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.black54, width: 1),
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.black38),
                    ),
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 20,),
                  Consumer<ProfileProvider>(
                    builder: (context, chipProvider, _) {
                      final interests = [
                        'Travel', 'Cooking', 'Yoga', 'Gaming', 'Movie', 'Photography',
                        'Music', 'Pets', 'Fashion', 'Reading', 'Dancing', 'Art', 'Drawing',
                        'Writing', 'Blogging', 'Hiking', 'Cycling', 'Fitness', 'Meditation',
                        'Crafting', 'Technology', 'DIY Projects', 'Gardening', 'Board Games',
                        'Collecting', 'Skating', 'Swimming', 'Astronomy', 'Karaoke',
                        'Language Learning', 'Podcasting', 'Investing', 'Public Speaking',
                      ];

                      return Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: interests.map((interest) => buildChip(interest, context)).toList(),
                      );
                    },
                  ),


                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: login,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "FINISH",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildChip(String label, BuildContext context) {
    final chipProvider = Provider.of<ProfileProvider>(context);
    final isSelected = chipProvider.isSelected(label);

    return GestureDetector(
      onTap: () => chipProvider.toggleChip(label),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? login : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

}
