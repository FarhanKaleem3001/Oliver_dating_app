import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const primarycolor = Colors.green;
const backgroundColor =  Color(0xFF38245E);
const cardbackgroundColor = Colors.white;
const appbackgroundcolor = Colors.white;
const appfontcolor = Colors.black;
const circle = Colors.brown;
const circle2 = Colors.green;
const skillColor = Colors.blue;
const hintcolor = Colors.black38;
const category = Colors.black87;
const feedcolor= Color(0xFF173979);
const shadowcolor= Colors.black12;
const enquirycolor= Color(0xFF1A0D4D);
const notcolor = Colors.black54;
const facebook =  Color(0xFF1877F2);
const link = Color(0xFF6195C3);
const des= Color(0xFF808080);
const locat =  Color(0xFFA5D5E3);
const singupin = Color(0xFF960FFF); //C3DE6D
const login = Color(0xFFC3DE6D);

class Font{
  static final TextStyle simpleFont = GoogleFonts.openSans(
    color: appfontcolor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle simpleFont3 = GoogleFonts.openSans(
    color: appfontcolor,
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle simpleFont2 = GoogleFonts.openSans(
    color: appfontcolor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle boldFont = GoogleFonts.openSans(
    color: appfontcolor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle boldFont1 = GoogleFonts.openSans(
    color: Colors.black87,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle boldFont3 = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle normalFont = GoogleFonts.openSans(
    color: appfontcolor,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle normalFont5 = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle normalFont4 = GoogleFonts.openSans(
    color: appfontcolor,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle normalFont3 = GoogleFonts.openSans(
    color: primarycolor,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle normalFont2 = GoogleFonts.openSans(
    color: hintcolor,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle skill = GoogleFonts.openSans(
    color: skillColor,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle feed = GoogleFonts.openSans(
    color: cardbackgroundColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle category = GoogleFonts.openSans(
    color: appfontcolor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle notnormal = GoogleFonts.openSans(
    color: hintcolor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle notbold = GoogleFonts.openSans(
    color: appfontcolor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle notnormal2 = GoogleFonts.openSans(
    color: hintcolor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle dashboard = GoogleFonts.openSans(
    color: enquirycolor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle notnormal3 = GoogleFonts.openSans(
    color: hintcolor,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle referrals = GoogleFonts.openSans(
    color: appfontcolor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle methodlink = GoogleFonts.openSans(
    color: link,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle description = GoogleFonts.openSans(
    color: des,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle veri = GoogleFonts.openSans(
    color: des,
    fontSize: 18,
    fontWeight: FontWeight.w500,

  );
  static final TextStyle bank = GoogleFonts.openSans(
    color: primarycolor,
    fontSize: 18,
    fontWeight: FontWeight.bold,

  );
  static final TextStyle boldFont2 = GoogleFonts.openSans(
    color: appfontcolor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle profile = GoogleFonts.openSans(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: enquirycolor
  );
  static final TextStyle profile1 = GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black54
  );
  static final TextStyle profile2 = GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.black87
  );
  static final TextStyle profile3 = GoogleFonts.openSans(
      fontSize: 16,
      color: Colors.black
  );
  static final TextStyle profilename = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    shadows: [Shadow(blurRadius: 5, color: Colors.black)],
  );
  static final TextStyle profileadd = GoogleFonts.openSans(
    color: appbackgroundcolor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    shadows: [Shadow(blurRadius: 5, color: Colors.black)],

  );
}