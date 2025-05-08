import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_mobile_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class ToDoCard extends StatelessWidget {
  ToDoCard({
    super.key,
    required this.task
  });

  Map<String, dynamic> task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border.all(color: Theme.of(context).shadowColor, width: 1.5),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task["title"], style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              Text(task["category"], style: GoogleFonts.poppins(color: task["color"], fontSize: 13, fontWeight: FontWeight.w600))
            ]
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 30, 
                height: 30, 
                child: Expanded(
                  child: Checkbox(
                    splashRadius: 25,
                    value: task["done"],
                    checkColor: Colors.white,
                    activeColor: Color(0xFF212121),
                    onChanged: (value) {
                      context.read<TodoProvider>().checkTask(task);
                    }
                  ),
                )
              ),
              SizedBox(width: 10),
              IconButton(
                splashRadius: 25,
                onPressed: () {
                  context.read<TodoProvider>().removeTask(task);
                }, 
                icon: Icon(Icons.delete_forever_rounded, size: 30,)
              )
            ]
          )
          
        ]
      )
    );
  }
}