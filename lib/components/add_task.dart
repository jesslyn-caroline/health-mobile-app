import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:health_mobile_app/providers/todo_provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  Widget divider = Container(width: double.infinity, height: 1.5, color: Color(0xFFC8C8C8));

  TextEditingController taskTitleC = TextEditingController();

  List<String> categories = ["Fitness", "Nutrition", "Self Care", "Other"];
  String? taskCategory = "Fitness";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: taskTitleC,
          maxLines: 2,
          decoration: InputDecoration(
            hintText: "New Task",
            hintStyle: GoogleFonts.poppins(color: Color(0xFF898989), fontSize: 15, fontWeight: FontWeight.w600),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: Colors.white,
            hoverColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.5),
              borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.5),
              borderRadius: BorderRadius.circular(10)
            )
          ),
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)
        ),
        SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...categories.map((category) {
                return Row(
                  children: [
                    Radio(
                      value: category,
                      groupValue: taskCategory,
                      activeColor: Color(0xFF0369A1),
                      onChanged: (value) {
                        setState(() {
                          taskCategory = value;
                        });
                      }
                    ),
                    Text(category, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500)),
                    SizedBox(width: 12)
                  ]
                );
              })
            ]
          ),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  taskTitleC.text = "";
                });
              },
              icon: Icon(Icons.clear_rounded, color: Colors.white, size: 20),
              label: Text("Clear", style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF212121),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: () {
                if (taskTitleC.text.isNotEmpty) {
                  context.read<TodoProvider>().addTask(taskTitleC.text, taskCategory);
                  taskTitleC.text = "";
                  taskCategory = "Fitness";
                }
              },
              icon: Icon(Icons.add_rounded, color: Colors.white, size: 20),
              label: Text("Add", style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF212121),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              )
            )
          ]
        ),
        SizedBox(height: 16),
        divider,
        SizedBox(height: 16),
      ]
    );
  }
}