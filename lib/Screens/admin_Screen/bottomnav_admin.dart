import 'package:flutter/material.dart';
import 'package:kmunity_se/Screens/Login_screen.dart';
import 'package:kmunity_se/Screens/Menu_screen.dart';
import 'package:kmunity_se/Screens/User_screen.dart';
import 'package:get/get.dart';
import 'package:kmunity_se/Screens/admin_Screen/menu_admin.dart';
import 'package:kmunity_se/Screens/home_screen.dart';
import 'package:kmunity_se/Screens/mailbox_screen.dart';
import 'package:kmunity_se/constant/constant.dart';

class Bottomnavadmin extends StatefulWidget {
  const Bottomnavadmin({super.key});

  @override
  State<Bottomnavadmin> createState() => _BottomnavadminState();
}

class _BottomnavadminState extends State<Bottomnavadmin> {
  bool isHomeOutline = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigatioadminController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0), 
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 50,
                color: Color.fromARGB(255, 255, 186, 130),
                offset: Offset(0, 0),
              )
            ],
          ),
          child: NavigationBar(
            // currentIndex: _currentIndex,

            height: 92,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,

            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.mail_outlined),
                label: 'Mailbox',
              ),
              
              NavigationDestination(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),

              NavigationDestination(
                icon: Icon(Icons.admin_panel_settings),
                label: 'Admin',
              ),

            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigatioadminController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    homescreen(),
    mailscreen(),
    menuscreen(),
    menuadminscreen()
  ];
}
