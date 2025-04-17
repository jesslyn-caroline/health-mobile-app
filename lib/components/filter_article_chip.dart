import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterArticleChip extends StatelessWidget {
  FilterArticleChip({super.key, required this.category, required this.func});

  dynamic category;
  void Function(dynamic, bool) func;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: FilterChip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xff0369A1)),
        ),
        selectedColor: Color(0xff0369A1),
        selected: category["isChecked"],
        backgroundColor: Colors.white,
        showCheckmark: false,
        label: Text(category["name"], style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: (category["isChecked"]? Colors.white : Colors.black)
          )
        ),
        onSelected: (selected) => func(category, selected),
      )
    );
  }
}