import 'package:flutter/material.dart';
import 'package:kahi_coffee/providers/account_provider.dart';
import 'package:kahi_coffee/screen/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AccountProvider(),
    child: const MyApp(),
  ));
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
