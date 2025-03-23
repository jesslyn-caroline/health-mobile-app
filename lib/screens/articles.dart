import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:health_mobile_app/components/article_card.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List articleList = [];

  Future<void> getArticles() async {
    final String response = await rootBundle.loadString('assets/json/articles.json');
    final data = await jsonDecode(response);
    setState(() => articleList = data);
  }

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.95,
        padding: EdgeInsets.fromLTRB(15, 70, 15, 40),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
                    Text("Don't miss the latest articles!", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700)),
                    Text('Learn more, gain knowledge', style: GoogleFonts.poppins(color: Color(0xFF898989), fontSize: 15, fontWeight: FontWeight.w600)),
                  ]
                )
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    ...articleList.map((article) {
                      return ArticleCard(
                        title: article['title'],
                        imageUrl: article['imageUrl'],
                        description: article['description'],
                        dateCreated: article['dateCreated'],
                        detail: article['detail']
                      );
                    })
                  ]
                ),
              )
            ]
          )
        ),
      )
    );
  }
}