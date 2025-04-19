import 'package:flutter/material.dart';

class UserProfileProvider with ChangeNotifier{

  String username = "Cinnamon";
  String password = "cinnamon123";
  String email = "cinnamon@mail.com";

  String invalidMsgUsername = "";
  String invalidMsgCurrentPassword = "";
  String invalidMsgNewPassword = "";
  String invalidMsgConfirmNewPassword = "";

  TextEditingController newusernameC = TextEditingController();

  TextEditingController currentpasswordC = TextEditingController();
  TextEditingController newpasswordC = TextEditingController();
  TextEditingController confirmnewpasswordC = TextEditingController();

  void checkUsernameValidity() {
    List <String> invalidCharacter = ["!", "@", "#", "\$", "%", "^", "&", "*", "+", "=", "|", "\\", ":", ";", ","];

    bool containInvalidCharacter = false;

    for (int i = 0; i < invalidCharacter.length; i++) {
      if (newusernameC.text.contains(invalidCharacter[i])) {
        containInvalidCharacter = true;
      }
    }

    if (username == newusernameC.text) invalidMsgUsername = "Please enter new username";
    else if (containInvalidCharacter) invalidMsgUsername = "Username may not contain special character";
    else if (newusernameC.text.isEmpty) invalidMsgUsername = "Username may not be empty";
    else invalidMsgUsername = "";

    notifyListeners();
  }

  void confirmCurrentPassword () {
    if (currentpasswordC.text != password) invalidMsgCurrentPassword = "Password not match";
    else invalidMsgCurrentPassword = "";

    notifyListeners();
  }

  bool changeUsername() {
    if (invalidMsgUsername == "" && invalidMsgCurrentPassword == "") {
      username = newusernameC.text;
      clearController();
      resetinvalidMsg();

      notifyListeners();
      
      return true;
    }

    return false;
  }
  
  void checkNewPassword () {
    if (newpasswordC.text.isEmpty) invalidMsgNewPassword = "New password may not be empty";
    else {
      invalidMsgNewPassword = "";
      if (newpasswordC.text != confirmnewpasswordC.text) invalidMsgConfirmNewPassword = "New password not match";
      else invalidMsgConfirmNewPassword = "";
    }

    notifyListeners();
  }

  bool changePassword () {
    if (invalidMsgCurrentPassword == "" && invalidMsgConfirmNewPassword == "" && !newpasswordC.text.isEmpty) {
      password = newpasswordC.text;
      clearController();
      resetinvalidMsg();

      notifyListeners();

      return true;
    }

    return false;
  }

  void clearController () {
    newusernameC.clear();
    currentpasswordC.clear();
    newpasswordC.clear();
    confirmnewpasswordC.clear();

    notifyListeners();
  }

  void resetinvalidMsg() {
    invalidMsgUsername = "";
    invalidMsgCurrentPassword = "";
    invalidMsgNewPassword = "";
    invalidMsgConfirmNewPassword = "";
  }
}