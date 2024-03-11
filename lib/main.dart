import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kmunity_se/Screens/Login_screen.dart';
import 'package:kmunity_se/Screens/User_screen.dart';
import 'package:kmunity_se/Screens/bottom_nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kmunity_se/component/databaseuser.dart';
import 'package:kmunity_se/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
      home:    LoginScreen(),
    );
  }
}