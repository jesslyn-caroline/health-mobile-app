import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_mobile_app/providers/page_provider.dart';
import 'package:provider/provider.dart';
import 'package:health_mobile_app/providers/todo_provider.dart';
import 'package:health_mobile_app/components/add_task.dart';
import 'package:health_mobile_app/components/todo_card.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  Widget divider = Container(width: double.infinity, height: 1.5, color: Color(0xFFC8C8C8));

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<TodoProvider>().changeActive("todo");
                          context.read<PageProvider>().changePage(0);
                        },
                        style: IconButton.styleFrom(overlayColor: Colors.transparent),
                        icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 20)
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("My To Do List", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700)),
                            Text("Stay healthy and productive all the time", style: GoogleFonts.poppins(color: Color(0xFF898989), fontSize: 15, fontWeight: FontWeight.w600)),
                          ]
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.read<TodoProvider>().changeActive("todo");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: context.watch<TodoProvider>().active == "todo" ? Color(0xFF212121) : Color(0xFFFDFDFD),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Color(0xFF212121))
                                    ),
                                    child: Row(
                                      children: [
                                        Text("To Do", style: GoogleFonts.poppins(color: context.watch<TodoProvider>().active == "todo" ? Colors.white : Color(0xFF212121), fontSize: 13, fontWeight: FontWeight.w600)),
                                        SizedBox(width: 6),
                                        Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: context.watch<TodoProvider>().active == "todo" ? Colors.white : Color(0xFF212121),
                                            shape: BoxShape.circle
                                          ),
                                          child: Text("${context.watch<TodoProvider>().todoCount}", style: GoogleFonts.poppins(color: context.watch<TodoProvider>().active == "todo" ? Color(0xFF212121) : Colors.white, fontSize: 11, fontWeight: FontWeight.w600))
                                        )
                                      ]
                                    )
                                  )
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    context.read<TodoProvider>().changeActive("finished");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: context.watch<TodoProvider>().active == "finished" ? Color(0xFF212121) : Color(0xFFFDFDFD),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Color(0xFF212121))
                                    ),
                                    child: Row(
                                      children: [
                                        Text("Finished", style: GoogleFonts.poppins(color: context.watch<TodoProvider>().active == "finished" ? Colors.white : Color(0xFF212121), fontSize: 13, fontWeight: FontWeight.w600)),
                                        SizedBox(width: 6),
                                        Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: context.watch<TodoProvider>().active == "finished" ? Colors.white : Color(0xFF212121),
                                            shape: BoxShape.circle
                                          ),
                                          child: Text("${context.watch<TodoProvider>().finishedCount}", style: GoogleFonts.poppins(color: context.watch<TodoProvider>().active == "finished" ? Color(0xFF212121) : Colors.white, fontSize: 11, fontWeight: FontWeight.w600))
                                        )
                                      ],
                                    )
                                  )
                                )
                              ]
                            ),
                            SizedBox(height: 16),
                            divider,
                            SizedBox(height: 16),
                            if (context.watch<TodoProvider>().active == "todo")
                              ...[
                                AddTask(),
                                ...context.watch<TodoProvider>().todoList
                                .where((task) => !task["done"])
                                .map((task) {
                                  return ToDoCard(task: task);
                                })
                              ]
                            else
                              ...context.watch<TodoProvider>().todoList
                                .where((task) => task["done"])
                                .map((task) {
                                  return ToDoCard(task: task);
                              })
                          ]
                        )
                      )
                    ]
                  ),
                ),
              ),
            ),
          )
        ]
    );
  }
}