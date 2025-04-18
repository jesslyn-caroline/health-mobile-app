import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:health_mobile_app/providers/todo_list_provider.dart';
import 'package:health_mobile_app/screens/todo_list.dart';
import 'package:health_mobile_app/components/new_task.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  TextEditingController taskC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
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
                      Text('Stay productive all the time!', style: GoogleFonts.poppins(color: Color(0xFF898989), fontSize: 15, fontWeight: FontWeight.w600)),
                    ]
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => {setState(() {
                          context.read<TodoListProvider>().changeActive("todo");
                        })},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(23, 6, 23, 6),
                          decoration: BoxDecoration(
                            color: (context.watch<TodoListProvider>().currentActive == "todo"? Colors.black : Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)
                          ),
                          child: Text("To Do", style: GoogleFonts.poppins(color: (context.watch<TodoListProvider>().currentActive == "todo"? Colors.white : Colors.black), fontSize: 13, fontWeight: FontWeight.w600),)
                        ),
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: () => {setState(() {
                          context.read<TodoListProvider>().changeActive("finished");
                        })},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(13, 6, 13, 6),
                          decoration: BoxDecoration(
                            color: (context.watch<TodoListProvider>().currentActive == "finished"? Colors.black : Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)
                          ),
                          child: Row(
                            children: [
                              Text("Finished", style: GoogleFonts.poppins(color: (context.watch<TodoListProvider>().currentActive == "finished"? Colors.white : Colors.black), fontSize: 13, fontWeight: FontWeight.w600),),
                              SizedBox(width: 10),
                              Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: (context.watch<TodoListProvider>().currentActive == "finished"? Colors.white : Colors.black),
                                  shape: BoxShape.circle
                                ),
                                child: Text("${context.watch<TodoListProvider>().totalFinished}", style: GoogleFonts.poppins(color: (context.watch<TodoListProvider>().currentActive == "finished"? Colors.black : Colors.white), fontSize: 11, fontWeight: FontWeight.w600),),
                              )
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Divider(),),
                SizedBox(height: 15),
                (context.watch<TodoListProvider>().currentActive == "todo"? 
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: NewTask()
                ) : 
                Container(width: double.infinity)),   
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TodoList()
                ),    
              ],
            )
          ),
        )
      ),
    );
  }
}