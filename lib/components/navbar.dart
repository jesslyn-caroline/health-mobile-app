import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:health_mobile_app/screens/home.dart';
import 'package:health_mobile_app/screens/articles.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.page});

  final String page;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Column(
              children: [
                Icon(Icons.home_rounded, color: page == 'home' ? Colors.white : Color(0xFFC8C8C8), size: 30),
                SizedBox(height: 3),
                Text('Home', style: GoogleFonts.poppins(color: page == 'home' ? Colors.white : Color(0xFFC8C8C8), fontSize: 13, fontWeight: FontWeight.w600))
              ]
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Articles()));
            },
            child: Column(
              children: [
                Icon(Icons.article_rounded, color: page == 'articles' ? Colors.white : Color(0xFFC8C8C8), size: 30),
                SizedBox(height: 3),
                Text('Articles', style: GoogleFonts.poppins(color: page == 'articles' ? Colors.white : Color(0xFFC8C8C8), fontSize: 13, fontWeight: FontWeight.w600))
              ]
            ),
          ),
          Column(
            children: [
              Icon(Icons.person_2_rounded, color: page == 'profile' ? Colors.white : Color(0xFFC8C8C8), size: 30),
              SizedBox(height: 3),
              Text('Profile', style: GoogleFonts.poppins(color: page == 'profile' ? Colors.white : Color(0xFFC8C8C8), fontSize: 13, fontWeight: FontWeight.w600))
            ]
          )
        ]
      )
    );
  }
}