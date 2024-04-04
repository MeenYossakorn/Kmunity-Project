import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kmunity_se/Screens/BookingBoardgame_screen.dart';
import 'package:kmunity_se/Screens/BookingBook_screen.dart';

import 'package:kmunity_se/Screens/Login_screen.dart';
import 'package:kmunity_se/Allroom/Room_screen.dart';
import 'package:kmunity_se/Screens/admin_Screen/admin_infor.dart';
import 'package:kmunity_se/Screens/admin_Screen/edit_book.dart';
import 'package:kmunity_se/Screens/admin_Screen/feedbackadmin.dart';
import 'package:kmunity_se/Screens/admin_Screen/movieinfo_admin.dart';

import 'package:kmunity_se/Screens/feedback_screen.dart';
import 'package:kmunity_se/Screens/movie_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class menuadminscreen extends StatefulWidget {
  menuadminscreen({super.key});

  @override
  State<menuadminscreen> createState() => _menuscreenState();
}

class _menuscreenState extends State<menuadminscreen> {
  var height, width;

  List imgIcon = [
    "assets/images/book.png",
    "assets/images/information.jpg",
    "assets/images/movie.png",
    "assets/images/feedback.png",
    
  ];

  List imgName = [
    "Book Manager",
    "Infomation Manager",
    "Movie Manager",
    "Feedback",
    
    

  ];

  List totap = [
    adminbook(),
    AdminInfoPage(),
    editmovie(),
    FirebaseListView(),
    
  ];

  void signUserOut() {
     FirebaseAuth.instance.signOut();
     
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('role');
    });
    Navigator.pushNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF7500), Colors.white],
          ),
        ),
        child: Column(
          children: [
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 50,),
                SizedBox(
                  height: height * 0.17, // เลื่อน Container สีเทาอยู่สูงขึ้น
                  child: Align(
                    alignment: Alignment
                        .bottomCenter, // จัด Text ไว้ที่ด้านล่างของ Container
                    child: Transform.translate(
                      offset: Offset(0, -30), // ลองปรับค่า offset เพื่อเลื่อนขึ้น
                      child: Text(
                        "MENU ADMIN",
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                 IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
              ],

            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // เปลี่ยนสีเป็นเทา
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Color(0xA2000000),
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                height: height * 0.70, // ปรับความสูงของ Container สีเทา
                width: width - 40,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0,
                      20.0), // เพิ่มพื้นที่ด้านล่างของ GridView.builder
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: imgIcon.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => totap[index]),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(
                              10.0), // ปรับตำแหน่งทั้งสี่ด้านของ Column
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.orange, // สีของเส้นขอบ
                                    width: 5, // ความกว้างของเส้นขอบ
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      15.0), // ปรับตำแหน่งของภาพ
                                  child: Image.asset(
                                    imgIcon[index],
                                    width: 60,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      5), // เพิ่มระยะห่างระหว่างภาพและข้อความ
                              Text(
                                imgName[index],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
