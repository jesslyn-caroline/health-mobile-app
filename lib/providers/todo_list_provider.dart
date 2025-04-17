import 'package:flutter/material.dart';

class TodoListProvider with ChangeNotifier {

  List <Map<String, dynamic>> todoList = [
    {
      "task" : "Hellooooooo",
      "finished" : false
    }
  ];


  String currentActive = "todo";

  void changeActive(String active) {
    currentActive = active;
    notifyListeners();
  }


  TextEditingController taskC = TextEditingController();
  String? categoryValue = "";

  List <String> category = ["Fitness", "Nutrition", "Self Care", "Others"];

  void setCategoryValue (String? value) {
    categoryValue = value;
    notifyListeners();
  }

  void addTask() {
    if (!taskC.text.isEmpty && categoryValue != "") {
      todoList.add({
        "task" : taskC.text,
        "finished" : false
      });
    }

    notifyListeners();
  }

  void removeNewTask() {
    taskC.clear();
    categoryValue = "";
    notifyListeners();
  }
  
}