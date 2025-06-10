import 'package:flutter/material.dart';
import 'package:health_mobile_app/providers/page_provider.dart';
import 'package:health_mobile_app/screens/bottom_sheet_new_task.dart';
import 'package:provider/provider.dart';

class NewNoteButton extends StatefulWidget {
  const NewNoteButton({super.key});

  @override
  State<NewNoteButton> createState() => _NewNoteButtonState();
}

class _NewNoteButtonState extends State<NewNoteButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(0))),
          context: context, 
          builder: (context) {
            return BottomSheetNewTask();
          });
      },
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Icon(Icons.add_rounded, size: 30)
    );
  }
}