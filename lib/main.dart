import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_mobile_app/providers/page_provider.dart';
import 'package:health_mobile_app/providers/profile_provider.dart';
import 'package:health_mobile_app/screens/add_task.dart';
import 'package:provider/provider.dart';
import 'package:health_mobile_app/providers/todo_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        body: SafeArea(
          child: context.read<PageProvider>().page[context.watch<PageProvider>().pageIndex]
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          backgroundColor: Color(0xFF1E1E1E),
          unselectedItemColor: Color(0xFFC8C8C8),
          selectedItemColor: Colors.white,
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
          selectedLabelStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
          currentIndex: context.watch<PageProvider>().pageIndex,
          onTap: (int index) => context.read<PageProvider>().changePage(index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.article_rounded), label: "Articles"),
            BottomNavigationBarItem(icon: Icon(Icons.task_outlined), label: "Tasks"),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: "Profile"),
          ]
        ),
        floatingActionButton: (
          context.watch<PageProvider>().pageIndex == 2? 
          Builder(
            builder: (context) {
              return FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NewTask())
                  );
                },
              );
            }
          )
        : null)
      )
    );
  }
}