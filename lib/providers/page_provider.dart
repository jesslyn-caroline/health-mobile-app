import 'package:flutter/material.dart';
import 'package:health_mobile_app/screens/articles.dart';
import 'package:health_mobile_app/screens/home.dart';
import 'package:health_mobile_app/screens/todo.dart';

class PageProvider with ChangeNotifier {
  int pageIndex = 0;
  List<Widget> page = [Home(), Articles(), ToDo()];
  String pageName = "";

  void changePage(int index) {
    pageIndex = index;
    if (pageIndex == 1) {
      pageName = "Articles";
    } else if (pageIndex == 2) {
      pageName = "My Tasks";
    } else if (pageIndex == 3) {
      pageName = "My Profile";
    } else {
      pageName = "";
    }
    notifyListeners();
  }
}