import 'package:flutter/material.dart';

class TodoListProvider with ChangeNotifier {

  List <Map<String, dynamic>> todoList = [
    
  ];

  int totalFinished = 0;
  int totalUnfinished = 0;

  void setTotalFinished() {
    totalFinished = todoList.where((e) => e["finished"] == true).length;

    notifyListeners();
  }

  void setTotalUnfinished() {
    totalUnfinished = todoList.where((e) => e["finished"] == false).length;

    notifyListeners();
  }

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
        "category" : categoryValue,
        "finished" : false
      });

      removeNewTask();
      setTotalUnfinished();
    }
    
    notifyListeners();
  }

  void removeNewTask() {
    taskC.clear();
    categoryValue = "";
    notifyListeners();
  }

  void finishTask(dynamic task, bool? value) {
    task["finished"] = value;
    notifyListeners();

    setTotalFinished();
    setTotalUnfinished();
  }

}