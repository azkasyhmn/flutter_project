import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text(
          'Fesnuk',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Selamat Datang di Fesnuk!',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}