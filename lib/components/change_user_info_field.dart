import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeUserInfoField extends StatelessWidget {
  ChangeUserInfoField({
    super.key,
    required this.inputType,
    required this.controller,
    required this.inputTitle,
    required this.errorMessage
  });
  
  TextEditingController controller;
  String inputTitle, inputType, errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(inputTitle, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: (inputType == "password" ? true : false),
          style: GoogleFonts.poppins(fontSize: 13),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            hintStyle: GoogleFonts.poppins(color: Color(0xFF898989), fontSize: 13),
            errorStyle: GoogleFonts.poppins(),
            focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
            hintText: "Enter ${inputTitle.toLowerCase()}",
            errorText: (errorMessage == "" ? null : errorMessage),
          )
        )
      ],
    );
  }
}