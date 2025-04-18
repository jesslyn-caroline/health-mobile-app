import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  InputField({super.key, required this.inputType, required this.controller, required this.inputTitle, required this.invalidMsg});
  
  TextEditingController controller;
  String inputTitle, inputType, invalidMsg;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${inputTitle}", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),),
          SizedBox(height: 5,),
          TextField(
            controller: controller,
            obscureText: (inputType == "password" ? true : false),
            style: GoogleFonts.poppins(),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              hintStyle: GoogleFonts.poppins(color: Color(0xFF898989)),
              errorStyle: GoogleFonts.poppins(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF1E1E1E))
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFC8C8C8))
              ),
              hintText: "Enter ${inputTitle.toLowerCase()}",
              errorText: (invalidMsg == "" ? null: invalidMsg),
            ),
          )
        ],
      )
    );
  }
}