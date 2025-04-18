import 'package:flutter/material.dart';

class UserProfileProvider with ChangeNotifier{

  String username = "Cinnamon";
  String password = "cinnamon123";
  String email = "cinnamon@mail.com";

  bool isPassword = true;

  TextEditingController newusernameC = TextEditingController();

  TextEditingController emailC = TextEditingController();

  TextEditingController currentpasswordC = TextEditingController();
  TextEditingController newpasswordC = TextEditingController();
  TextEditingController confirmnewpasswordC = TextEditingController();

  void confirmCurrentPassword () {
    if (currentpasswordC.text != password) isPassword = false;
    else isPassword = true;

    notifyListeners();
  }
}