import 'package:flutter/material.dart';
import 'package:kmunity_se/Screens/Login_screen.dart';
import 'package:kmunity_se/Screens/User_screen.dart';
import 'package:kmunity_se/constant/constant.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  List<Widget> body = [
    LoginScreen(),
    userscreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: body[_currentIndex]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Color(0xA2000000),
              offset: Offset(0,0),
            )
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          fixedColor: textColorOrange,
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items:  const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: 'User',
             
            ),
          ],
        ),
      ),
    );
  }
}
