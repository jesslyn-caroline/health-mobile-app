import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:health_mobile_app/providers/todo_list_provider.dart';
import 'package:health_mobile_app/components/todo_card.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...context.watch<TodoListProvider>().todoList.where((e) {
          return e["finished"] == (context.watch<TodoListProvider>().currentActive == "todo" ? false : true);
        }).map((task) {
          return TodoCard(
            task: task, 
            func: (task, value) {
              context.read<TodoListProvider>().finishTask(task, value);
            }
          );
        })
      ]
    );
  }
}