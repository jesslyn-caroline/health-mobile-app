import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:health_mobile_app/components/filter_article_chip.dart';
import 'package:health_mobile_app/components/navbar.dart';
import 'package:health_mobile_app/components/article_card.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List articleList = [];

  Future<void> getArticles() async {
    final String response = await rootBundle.loadString('/json/articles.json');
    final data = await jsonDecode(response);
    setState(() => articleList = data);
  }

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  List <Map <String, dynamic>> filterCategories = [
    {
      "name" : "Lifestyle",
      "isChecked" : false,
    },
    {
      "name": "Healthy Food",
      "isChecked" : false,
    },
    {
      "name" : "Fitness",
      "isChecked" : false
    }
  ];

  List <String> filteredCategory = [];

  void filterArticles(dynamic category, bool value) {
    setState(() {
      if (category["isChecked"]) filteredCategory.remove(category["name"]);
      else filteredCategory.add(category["name"]);

      category["isChecked"] = value;

      print(filteredCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        style: IconButton.styleFrom(overlayColor: Colors.transparent),
                        icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 20)
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
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Filter by tags", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child:  Row(
                          children: [
                            ...filterCategories.map((category) => FilterArticleChip(category: category, func: (category, value) {filterArticles(category, value);}))
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            ...articleList.where((article) {
                              return filteredCategory.contains(article['category']) || filteredCategory.isEmpty ? true : false;
                            }).map((article) {
                              return ArticleCard(
                                title: article['title'],
                                author: article['author'],
                                dateCreated: article['dateCreated'],
                                imageUrl: article['imageUrl'],
                                description: article['description'],
                                detail: article['detail']
                              );
                            })
                          ]
                        ),
                      )
                    ]
                  ),
                )
              ),
            ),
            Navbar(page: 'articles')
          ]
        ),
      )
    );
  }
}