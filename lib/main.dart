import 'package:flutter/material.dart';
import 'package:kmunity_se/Screens/Login_screen.dart';
import 'package:kmunity_se/Screens/User_screen.dart';
import 'package:kmunity_se/Screens/bottom_nav.dart';
import 'package:kmunity_se/Screens/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : 'Onboarding screen',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home:  const Bottomnavigationbar(),
    );
  }
}