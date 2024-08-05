import 'package:flutter/material.dart';
import 'package:kahi_coffee/screen/bottom_bar.dart';
import 'package:kahi_coffee/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
