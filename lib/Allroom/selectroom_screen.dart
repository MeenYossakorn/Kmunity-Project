import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kmunity_se/Auth/authentication.dart';
import 'package:kmunity_se/Screens/BookingBoardgame_screen.dart';
import 'package:kmunity_se/Screens/BookingBook_screen.dart';
import 'package:kmunity_se/Screens/bottom_nav.dart';
import "package:google_fonts/google_fonts.dart";

class selectroomscreen extends StatefulWidget {

  @override
  State<selectroomscreen> createState() => _selectroomscreenState();
}

class _selectroomscreenState extends State<selectroomscreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFF7500), Colors.white],
        )),
        child: Stack(
          children: [
            Positioned(
                top: 48,
                left: 25,
                right: 75,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bottomnavigationbar()),
                        );
                      },
                      child: Icon(
                        Icons.close_sharp,
                        size: 35,
                      ),
                    )
                  ],
                )),
            Positioned(
                top: 80,
                left: 50,
                right: 50,
                child: Center(
                  child: Text(
                    "Booking Book",
                    style: GoogleFonts.inter(
                      // textStyle: Theme.of(context).textTheme.titleLarge,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
            Positioned(
                top: 140,
                left: 10,
                right: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color.fromARGB(161, 110, 110, 110),
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                  width: width - 40,
                  height: height * 0.75,
                )) 
          ],
        ),
      ),
    );
  }

  
  // void showAwesomeDialog(
  //     BuildContext context, DocumentSnapshot d, String collection1) {
  //   AwesomeDialog(
  //     context: context,
  //     title: 'ยืนยันการยืมหนังสือ',
  //     titleTextStyle: GoogleFonts.inter(
  //       // textStyle: Theme.of(context).textTheme.titleLarge,
  //       fontSize: 25,
  //       fontWeight: FontWeight.bold,
  //       color: const Color.fromARGB(255, 246, 121, 112),
  //     ),
  //     btnOkOnPress: d["status"]
  //         ? () {
  //             showAwesomeDialog3(context);
  //           }
  //         : () {
  //             showAwesomeDialog2(context);
  //             FirebaseAuthService().Update_User_board(d["ID"]);
  //             FirebaseAuthService().Update_Board(collection1, d["ID"], true);
  //             FirebaseAuthService().Update_user_board1(true);
  //           },
  //     btnOkColor: const Color.fromARGB(255, 112, 157, 114),
  //     btnOkText: "ยืนยัน",
  //     btnCancelOnPress: () {},
  //     btnCancelColor: const Color.fromARGB(255, 246, 121, 112),
  //     btnCancelText: "ยกเลิก",
  //   ).show();
  // }

  // void showAwesomeDialog2(BuildContext context) {
  //   AwesomeDialog(
  //           context: context,
  //           dialogType: DialogType.success,
  //           title: 'การยืมสำเร็จ',
  //           titleTextStyle: GoogleFonts.inter(
  //             // textStyle: Theme.of(context).textTheme.titleLarge,
  //             fontSize: 25,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.green,
  //           ),
  //           btnCancelOnPress: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => Bottomnavigationbar()),
  //             );
  //           },
  //           btnCancelColor: const Color.fromARGB(255, 112, 157, 114),
  //           btnCancelText: "กลับไปยังหน้าหลัก")
  //       .show();
  // }

  // void showAwesomeDialog3(BuildContext context) {
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: DialogType.error,
  //     title: 'การยืมล้มเหลวโปรดลองใหม่อีกครั้ง',
  //     desc: "มีการยืมหนังสือไปเเล้วหรือคุณมีหนังสือที่ยืมอยู่เเล้ว",
  //     descTextStyle: GoogleFonts.inter(
  //       // textStyle: Theme.of(context).textTheme.titleLarge,
  //       fontSize: 15,
  //       fontWeight: FontWeight.w700,
  //       color: Color.fromARGB(255, 250, 200, 197),
  //     ),
  //     titleTextStyle: GoogleFonts.inter(
  //       // textStyle: Theme.of(context).textTheme.titleLarge,
  //       fontSize: 25,
  //       fontWeight: FontWeight.bold,
  //       color: const Color.fromARGB(255, 246, 121, 112),
  //     ),
  //     btnCancelOnPress: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => bookingboardgamescreen()),
  //       );
  //     },
  //     btnCancelColor: const Color.fromARGB(255, 246, 121, 112),
  //     btnCancelText: "กลับไปยังหน้าหลัก",
  //   ).show();
  // }
}
