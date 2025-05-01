import 'package:dating_site/Screen/signin.dart';
import 'package:dating_site/Screen/signupnext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../Provider/profileProvider.dart';
import '../Provider/videoProvider.dart';
import '../Utils/color.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String selectedCountryCode = "+91";
  final List<Map<String, String>> countryList = [
    {"code": "AF", "name": "Afghanistan", "flag": "🇦🇫", "dial_code": "+93"},
    {"code": "AL", "name": "Albania", "flag": "🇦🇱", "dial_code": "+355"},
    {"code": "DZ", "name": "Algeria", "flag": "🇩🇿", "dial_code": "+213"},
    {"code": "AD", "name": "Andorra", "flag": "🇦🇩", "dial_code": "+376"},
    {"code": "AO", "name": "Angola", "flag": "🇦🇴", "dial_code": "+244"},
    {"code": "AR", "name": "Argentina", "flag": "🇦🇷", "dial_code": "+54"},
    {"code": "AM", "name": "Armenia", "flag": "🇦🇲", "dial_code": "+374"},
    {"code": "AU", "name": "Australia", "flag": "🇦🇺", "dial_code": "+61"},
    {"code": "AT", "name": "Austria", "flag": "🇦🇹", "dial_code": "+43"},
    {"code": "AZ", "name": "Azerbaijan", "flag": "🇦🇿", "dial_code": "+994"},
    {"code": "BH", "name": "Bahrain", "flag": "🇧🇭", "dial_code": "+973"},
    {"code": "BD", "name": "Bangladesh", "flag": "🇧🇩", "dial_code": "+880"},
    {"code": "BY", "name": "Belarus", "flag": "🇧🇾", "dial_code": "+375"},
    {"code": "BE", "name": "Belgium", "flag": "🇧🇪", "dial_code": "+32"},
    {"code": "BR", "name": "Brazil", "flag": "🇧🇷", "dial_code": "+55"},
    {"code": "BG", "name": "Bulgaria", "flag": "🇧🇬", "dial_code": "+359"},
    {"code": "CA", "name": "Canada", "flag": "🇨🇦", "dial_code": "+1"},
    {"code": "CL", "name": "Chile", "flag": "🇨🇱", "dial_code": "+56"},
    {"code": "CN", "name": "China", "flag": "🇨🇳", "dial_code": "+86"},
    {"code": "CO", "name": "Colombia", "flag": "🇨🇴", "dial_code": "+57"},
    {"code": "HR", "name": "Croatia", "flag": "🇭🇷", "dial_code": "+385"},
    {"code": "CU", "name": "Cuba", "flag": "🇨🇺", "dial_code": "+53"},
    {"code": "CY", "name": "Cyprus", "flag": "🇨🇾", "dial_code": "+357"},
    {"code": "CZ", "name": "Czech Republic", "flag": "🇨🇿", "dial_code": "+420"},
    {"code": "DK", "name": "Denmark", "flag": "🇩🇰", "dial_code": "+45"},
    {"code": "EG", "name": "Egypt", "flag": "🇪🇬", "dial_code": "+20"},
    {"code": "FR", "name": "France", "flag": "🇫🇷", "dial_code": "+33"},
    {"code": "DE", "name": "Germany", "flag": "🇩🇪", "dial_code": "+49"},
    {"code": "GR", "name": "Greece", "flag": "🇬🇷", "dial_code": "+30"},
    {"code": "HK", "name": "Hong Kong", "flag": "🇭🇰", "dial_code": "+852"},
    {"code": "IN", "name": "India", "flag": "🇮🇳", "dial_code": "+91"},
    {"code": "ID", "name": "Indonesia", "flag": "🇮🇩", "dial_code": "+62"},
    {"code": "IR", "name": "Iran", "flag": "🇮🇷", "dial_code": "+98"},
    {"code": "IQ", "name": "Iraq", "flag": "🇮🇶", "dial_code": "+964"},
    {"code": "IE", "name": "Ireland", "flag": "🇮🇪", "dial_code": "+353"},
    {"code": "IL", "name": "Israel", "flag": "🇮🇱", "dial_code": "+972"},
    {"code": "IT", "name": "Italy", "flag": "🇮🇹", "dial_code": "+39"},
    {"code": "JP", "name": "Japan", "flag": "🇯🇵", "dial_code": "+81"},
    {"code": "JO", "name": "Jordan", "flag": "🇯🇴", "dial_code": "+962"},
    {"code": "KE", "name": "Kenya", "flag": "🇰🇪", "dial_code": "+254"},
    {"code": "KW", "name": "Kuwait", "flag": "🇰🇼", "dial_code": "+965"},
    {"code": "MY", "name": "Malaysia", "flag": "🇲🇾", "dial_code": "+60"},
    {"code": "MX", "name": "Mexico", "flag": "🇲🇽", "dial_code": "+52"},
    {"code": "MA", "name": "Morocco", "flag": "🇲🇦", "dial_code": "+212"},
    {"code": "NL", "name": "Netherlands", "flag": "🇳🇱", "dial_code": "+31"},
    {"code": "NZ", "name": "New Zealand", "flag": "🇳🇿", "dial_code": "+64"},
    {"code": "NG", "name": "Nigeria", "flag": "🇳🇬", "dial_code": "+234"},
    {"code": "NO", "name": "Norway", "flag": "🇳🇴", "dial_code": "+47"},
    {"code": "OM", "name": "Oman", "flag": "🇴🇲", "dial_code": "+968"},
    {"code": "PK", "name": "Pakistan", "flag": "🇵🇰", "dial_code": "+92"},
    {"code": "PH", "name": "Philippines", "flag": "🇵🇭", "dial_code": "+63"},
    {"code": "PL", "name": "Poland", "flag": "🇵🇱", "dial_code": "+48"},
    {"code": "PT", "name": "Portugal", "flag": "🇵🇹", "dial_code": "+351"},
    {"code": "QA", "name": "Qatar", "flag": "🇶🇦", "dial_code": "+974"},
    {"code": "RO", "name": "Romania", "flag": "🇷🇴", "dial_code": "+40"},
    {"code": "RU", "name": "Russia", "flag": "🇷🇺", "dial_code": "+7"},
    {"code": "SA", "name": "Saudi Arabia", "flag": "🇸🇦", "dial_code": "+966"},
    {"code": "SG", "name": "Singapore", "flag": "🇸🇬", "dial_code": "+65"},
    {"code": "ZA", "name": "South Africa", "flag": "🇿🇦", "dial_code": "+27"},
    {"code": "KR", "name": "South Korea", "flag": "🇰🇷", "dial_code": "+82"},
    {"code": "ES", "name": "Spain", "flag": "🇪🇸", "dial_code": "+34"},
    {"code": "SE", "name": "Sweden", "flag": "🇸🇪", "dial_code": "+46"},
    {"code": "CH", "name": "Switzerland", "flag": "🇨🇭", "dial_code": "+41"},
    {"code": "TH", "name": "Thailand", "flag": "🇹🇭", "dial_code": "+66"},
    {"code": "TR", "name": "Turkey", "flag": "🇹🇷", "dial_code": "+90"},
    {"code": "GB", "name": "United Kingdom", "flag": "🇬🇧", "dial_code": "+44"},
    {"code": "US", "name": "United States", "flag": "🇺🇸", "dial_code": "+1"},
  ];

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<ProfileProvider>(context);
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
            padding: const EdgeInsets.only(top: 250),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Sign Up ",
                          style: Font.boldFont1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'If you already have an account register.',
                          style: Font.normalFont,
                        ),
                        Row(
                          children: [
                            Text(
                              'You can ',
                              style: Font.normalFont,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                              },
                              child: Text(
                                ' Login here ! ',
                                style: TextStyle(
                                    color: login,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              Icons.mail_outline_rounded,
                              color: login,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Email',
                              style: TextStyle(
                                  color: login,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: emailController,
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
                              contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        //const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_android_outlined,
                              color: login,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                  color: login,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: 140,
                              child: Container(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: loginProvider.selectedCountry,
                                    isExpanded: true,
                                    items: countryList.map((country) {
                                      return DropdownMenuItem<String>(
                                        value: country["code"],
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 5),
                                            Text(country["flag"]!),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                country["name"]!,
                                                style: const TextStyle(
                                                    fontSize: 14),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              country["dial_code"]!,
                                              style:
                                              const TextStyle(fontSize: 14),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      loginProvider.setSelectedCountry(value!);
                                    },
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return countryList.map<Widget>((country) {
                                        return Row(
                                          children: [
                                            Text(country["flag"]!),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                country["name"]!,
                                                style: const TextStyle(
                                                    fontSize: 14),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              country["dial_code"]!,
                                              style:
                                              const TextStyle(fontSize: 14),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: TextField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Phone no.",
                                    hintStyle: TextStyle(color: hintcolor),
                                    border: const UnderlineInputBorder(),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: login),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(
                              Icons.lock_outline,
                              color: login,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                  color: login,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Consumer<ProfileProvider>(
                            builder: (context, passwordProvider, child) {
                              return TextField(
                                // controller: passwordController,
                                obscureText: !passwordProvider.isVisible,
                                decoration: InputDecoration(
                                  hintText: "  Enter Your Password",
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
                                      passwordProvider.isVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed:
                                    passwordProvider.toggleVisibility,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpNext()));
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
