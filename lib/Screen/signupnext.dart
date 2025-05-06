import 'package:dating_site/Provider/profileProvider.dart';
import 'package:dating_site/Screen/signup.dart';
import 'package:dating_site/Screen/signupfinal.dart';
import 'package:dating_site/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../Provider/videoProvider.dart';

class SignUpNext extends StatefulWidget {
  final Map<String, dynamic> profile;
  final int index;
  const SignUpNext({required this.profile, required this.index});

  @override
  State<SignUpNext> createState() => _SignUpNextState();
}

class _SignUpNextState extends State<SignUpNext> {
  DateTime? selectedDate;
  String? selectedGender;
  String? selectedLooking;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController lookingController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Text("Personal Information", style: Font.boldFont1),
                        const SizedBox(height: 10),

                        // Center(child: Text("Profile Picture", style: TextStyle(color: singupin, fontSize: 18, fontWeight: FontWeight.bold))),

                        const SizedBox(height: 20),

                        Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              color: login,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'First Name',
                              style: TextStyle(
                                  color:login,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                              hintText: "Enter Your First Name",
                              hintStyle: TextStyle(color: hintcolor),
                              border: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: login),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        //  const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              color: login,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Last Name',
                              style: TextStyle(
                                  color: login,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                              hintText: "Enter Your Last Name",
                              hintStyle: TextStyle(color: hintcolor),
                              border: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: login),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        //  const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              color: login,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Nick Name',
                              style: TextStyle(
                                  color: login,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: nickNameController,
                            decoration: InputDecoration(
                              hintText: "Enter Your Nickname",
                              hintStyle: TextStyle(color: hintcolor),
                              border: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: login),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.cake_outlined,
                              color: login,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Birthday',
                              style: TextStyle(
                                  color: login,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: birthdayController,
                            readOnly: true,
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());

                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: selectedDate ?? DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      primaryColor: login,
                                      colorScheme: ColorScheme.light(
                                        primary: login,
                                        onPrimary: Colors.white,
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor: login,
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (picked != null) {
                                selectedDate = picked;
                                birthdayController.text =
                                "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Select Your Birthday",
                              hintStyle: TextStyle(color: hintcolor),
                              border: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: login),
                              ),
                              suffixIcon: Icon(Icons.calendar_today, color: login),
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Image.asset(
                              'image/gender.png',
                              height: 20,
                              color:login,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Gender',
                              style: TextStyle(
                                  color: login,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: genderController,
                            readOnly: true,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Select Your Gender',
                                          style: Font.boldFont,
                                        ),
                                        ListTile(
                                          title: const Text("Male"),
                                          onTap: () {
                                            genderController.text = "Male";
                                            selectedGender = "Male";
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text("Female"),
                                          onTap: () {
                                            genderController.text = "Female";
                                            selectedGender = "Female";
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text("Non-Binary"),
                                          onTap: () {
                                            genderController.text =
                                                "Non-Binary";
                                            selectedGender = "Non-Binary";
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text(
                                              "Prefer Not to Answer"),
                                          onTap: () {
                                            genderController.text =
                                                "Prefer Not to Answer";
                                            selectedGender =
                                                "Prefer Not to Answer";
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            decoration: InputDecoration(
                              hintText: "Select Your Gender",
                              hintStyle: TextStyle(color: hintcolor),
                              border: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: login),
                              ),
                              suffixIcon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),

                        Row(
                          children: [
                            Image.asset(
                              'image/seeing.png',
                              height: 30,
                              color: login,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Looking For',
                              style: TextStyle(
                                  color: login,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: lookingController,
                            readOnly: true,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Looking For',
                                          style: Font.boldFont,
                                        ),
                                        ListTile(
                                          title: const Text("Dating"),
                                          onTap: () {
                                            lookingController.text = "Dating";
                                            selectedLooking = "Dating";
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text("Friendship"),
                                          onTap: () {
                                            lookingController.text =
                                                "Friendship";
                                            selectedLooking = "Friendship";
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text("Casual"),
                                          onTap: () {
                                            lookingController.text = "Casual";
                                            selectedLooking = "Casual";
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text(
                                              "Prefer Not to Answer"),
                                          onTap: () {
                                            lookingController.text =
                                                "Prefer Not to Answer";
                                            selectedLooking =
                                                "Prefer Not to Answer";
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            decoration: InputDecoration(
                              hintText: "Looking For",
                              hintStyle: TextStyle(color: hintcolor),
                              border: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: login),
                              ),
                              suffixIcon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),

                        Row(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              color: login,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Live In',
                              style: TextStyle(
                                  color: login,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Consumer<ProfileProvider>(
                          builder: (context, cityProvider, child) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: DropdownButtonFormField<String>(
                                value: cityProvider.selectedCity,
                                items: cityProvider.belgiumCities
                                    .map((String city) {
                                  return DropdownMenuItem<String>(
                                    value: city,
                                    child: Text(city),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    cityProvider.setSelectedCity(newValue);
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "Select Your City",
                                  hintStyle: TextStyle(color: hintcolor),
                                  border: const UnderlineInputBorder(),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: login),
                                  ),

                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                              ),
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
                                      builder: (context) => SignUpFinal(profile: {}, index: widget.index,)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: login,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "NEXT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
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
        ],
      ),
    );
  }
}
