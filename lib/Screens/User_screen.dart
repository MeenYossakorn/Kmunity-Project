import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmunity_se/component/My_IconButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kmunity_se/component/databaseuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kmunity_se/Screens/bottom_nav.dart';
import 'package:kmunity_se/Screens/home_screen.dart';
import 'package:kmunity_se/component/my_button.dart';
import 'package:kmunity_se/component/my_textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userscreen extends StatefulWidget {
  const userscreen({super.key});

  @override
  State<userscreen> createState() => _userscreenState();
}

// String uid = userCredential.user!.uid;
// DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('user').doc(uid).get();
// String? userRole = userSnapshot.get('role');

class _userscreenState extends State<userscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
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
                  top: 58,
                  left: 116,
                  child: Text(
                    "PROFILE",
                    style: GoogleFonts.inter(
                      // textStyle: Theme.of(context).textTheme.titleLarge,
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                  top: 112,
                  left: 50,
                  right: 50,
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0xA2000000),
                            offset: Offset(2, 2),
                          )
                        ],
                      ),
                      width: 310,
                      height: 280,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Positioned(
                            top: 124,
                            left: 50,
                            right: 50,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.white, Colors.orange],
                                ),
                              ),
                              width: 134,
                              height: 134,
                            ),
                          ),

                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('user')
                                  .doc('4HU7yiQfdzOvvtos4s1rYJZJBjt1')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var email = snapshot.data?.data()?['name'];
                                  return Center(
                                    child: Text(
                                      email ??'No data',
                                      style: GoogleFonts.inter(
                                        // textStyle: Theme.of(context).textTheme.titleLarge,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                        color: const Color(0xFFFF7500),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }), //เเก้ไขครั้งหน้า

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.verified_user,
                                size: 13,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "s6403051633122@kmutnb.ac.th",
                                style: GoogleFonts.inter(
                                  // textStyle: Theme.of(context).textTheme.titleLarge,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFFFF7500),
                                ),
                              ), //เเก้ไขครั้งหน้า
                            ],
                          )
                        ],
                      ))),
              Positioned(
                  top: 408,
                  left: 50,
                  right: 50,
                  child: Container(
                    width: 359,
                    height: 425,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color(0xA2000000),
                          offset: Offset(2, 2),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 100,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF7302),
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0xFF000000),
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "ข้อมูลส่วนตัว",
                                  style: GoogleFonts.inter(
                                    // textStyle: Theme.of(context).textTheme.titleLarge,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // SingleChildScrollView(
                        //   child: Column(
                        //     children: List.generate(
                        //       15,
                        //       (index) => ListTile(
                        //         title: Text('Item $index'),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ))
            ],
          )),
      //     bottomNavigationBar: Stack(
      //   children: [
      //     Positioned(
      //       top: 752,
      //       child: Container(
      //         width: 390,
      //         height: 184,
      //         decoration: const BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.all(Radius.circular(24)),
      //           boxShadow: [
      //             BoxShadow(
      //               blurRadius: 10,
      //               color: Color(0xA2000000),
      //               offset: Offset(2, 2),
      //             )
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
