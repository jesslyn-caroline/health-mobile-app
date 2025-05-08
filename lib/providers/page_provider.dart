import 'package:flutter/material.dart';
import 'package:health_mobile_app/screens/articles.dart';
import 'package:health_mobile_app/screens/home.dart';
import 'package:health_mobile_app/screens/profile.dart';
import 'package:health_mobile_app/screens/todo.dart';

class PageProvider with ChangeNotifier {
  int pageIndex = 0;
  List<Widget> page = [Home(), Articles(), ToDo(), Profile()];

  void changePage(int index) {
    pageIndex = index;
    notifyListeners();
  }
}