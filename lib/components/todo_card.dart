import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class TodoCard extends StatelessWidget {
  TodoCard({super.key, required this.task, required this.func});

  dynamic task;
  void Function(dynamic task, bool? value) func;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black)
      ),
      child: CheckboxListTile(
        tileColor: Colors.white,
        title: Text(task["task"], style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500)),
        subtitle: Text(task["category"], style: 
          GoogleFonts.poppins(
            fontSize: 13, 
            fontWeight: FontWeight.w500,
            color: (
              task["category"] == "Fitness" ? Color(0xff0369A1) :
              task["category"] == "Nutrition" ? Color(0xff16A34A) :
              task["category"] == "Self Care" ? Color(0xffCA8A04) :
              Colors.blueGrey
            )
          )
        ),
        value: task["finished"], 
        onChanged: (value) {
          func(task, value);
        }
      )
    );
  }
}