import 'package:flutter/material.dart';
import 'package:project_1/pages/BMIScreen.dart';
// import 'package:project_1/pages/KartuNama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      home: BMIScreen(),
    );
  }
}


