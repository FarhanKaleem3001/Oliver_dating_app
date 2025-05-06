import 'package:flutter/material.dart';

import '../Utils/color.dart';
class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.favorite, color: Colors.red,),
            //Image.asset('image/heart.png', height: 20, width: 20,),
            SizedBox(width: 5),
            Text('MIX OF COLOR', style: Font.boldFont),
          ],
        ),
        Spacer(),
        Image.asset('image/bell.png', height: 20,width: 20,),
        SizedBox(width: 10),
        Image.asset('image/filter.png', height: 20,width: 20,),
        SizedBox(width: 10),
        Image.asset('image/profile.png', height: 20,width: 20,),

      ],
    );
  }
}
