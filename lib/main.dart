import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:health_mobile_app/providers/profile_provider.dart';
import 'package:health_mobile_app/providers/todo_provider.dart';
import 'package:health_mobile_app/screens/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoProvider()
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider()
        )
      ],
      child: MyApp()
    )
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