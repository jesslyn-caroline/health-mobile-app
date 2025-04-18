import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:health_mobile_app/providers/todo_list_provider.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: context.watch<TodoListProvider>().taskC,
          decoration: InputDecoration(
            hintStyle: GoogleFonts.poppins(color: Color(0xFF898989), fontWeight: FontWeight.w500),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFF1E1E1E))
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFFC8C8C8))
            ),
            hintText: "New task",
          ),
          maxLines: 2,
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...context.watch<TodoListProvider>().category.map((e) {
              return SizedBox(
                  child: Row(
                    children: [
                      Radio(
                        fillColor: MaterialStatePropertyAll(Color(0xFF0369A1)),
                        value: e, 
                        groupValue: context.watch<TodoListProvider>().categoryValue, 
                        onChanged: (value) {
                          context.read<TodoListProvider>().setCategoryValue(value);
                        }
                      ),
                      SizedBox(width: 8),
                      Text(e, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),)
                    ]
                  ),
                );
              }
            )
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1e1e1e),
                padding: EdgeInsets.fromLTRB(10, 15, 18, 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              icon: Icon(Icons.highlight_remove, size: 25, color: Colors.white,),
              onPressed: () {context.read<TodoListProvider>().removeNewTask();},
              label: Text("Remove", style: GoogleFonts.poppins(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600))
            ),
            SizedBox(width: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1e1e1e),
                padding: EdgeInsets.fromLTRB(10, 15, 18, 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              icon: Icon(Icons.add, size: 25, color: Colors.white,),
              onPressed: () {context.read<TodoListProvider>().addTask();},
              label: Text("Add", style: GoogleFonts.poppins(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600))
            )
          ],
        ),
        SizedBox(height: 15),
        Divider(),
        SizedBox(height: 15),
      ],
    );
  }
}