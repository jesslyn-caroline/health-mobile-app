import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:health_mobile_app/providers/todo_list_provider.dart';
import 'package:health_mobile_app/screens/home.dart';
import 'package:health_mobile_app/providers/user_profile_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoListProvider()),
        ChangeNotifierProvider(create: (context) => UserProfileProvider()),
      ],
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}