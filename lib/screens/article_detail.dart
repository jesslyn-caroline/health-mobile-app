import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleDetail extends StatelessWidget {
  final String title, imageUrl, description, dateCreated;
  final List detail;

  const ArticleDetail({super.key, required this.title, required this.imageUrl, required this.description, required this.dateCreated, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 70, 15, 40),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                style: IconButton.styleFrom(overlayColor: Colors.transparent),
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 21)
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title, 
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(dateCreated, style: GoogleFonts.poppins(color: Color(0xFF898989), fontSize: 12, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
                    ),
                    SizedBox(height: 15),
                    ...detail.map((paragraph) => 
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text(paragraph, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400), textAlign: TextAlign.justify,)
                      )
                    )
                  ],
                ),
              )
            ],
          )
        )
      ),
    );
  }
}