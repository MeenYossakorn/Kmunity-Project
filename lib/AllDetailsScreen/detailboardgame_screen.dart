import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kmunity_se/Auth/authentication.dart';
import 'package:kmunity_se/Screens/BookingBook_screen.dart';
import 'package:kmunity_se/Screens/bottom_nav.dart';
import "package:google_fonts/google_fonts.dart";

class detailboardgamescreen extends StatefulWidget {
  final String Namebook;
  final String Detailbook;
  final String image;
  final String documentID;
  final String collec;
  final DocumentSnapshot d;

  detailboardgamescreen(this.Namebook, this.Detailbook, this.image,
      this.documentID, this.collec, this.d);

  @override
  State<detailboardgamescreen> createState() => _detailboardgamescreenState();
}

class _detailboardgamescreenState extends State<detailboardgamescreen> {
  @override
  Widget build(BuildContext context) {
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
                              builder: (context) => bookingbookscreen()),
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
                left: 50,
                right: 50,
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
                  width: 330,
                  height: 600,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(15, 255, 174, 0),

                          // color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 250,
                        height: 50,
                        child: Center(
                          child: Text(
                            "รายละเอียดหนังสือ",
                            style: GoogleFonts.inter(
                              // textStyle: Theme.of(context).textTheme.titleLarge,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      Container(
                          height: 210,
                          width: 140,
                          child: Image.network(widget.image)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.Namebook,
                        style: GoogleFonts.inter(
                          // textStyle: Theme.of(context).textTheme.titleLarge,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF5B5B),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SingleChildScrollView(
                            child: Center(
                              child: Text(
                                widget.Detailbook,
                                style: GoogleFonts.inter(
                                  // textStyle: Theme.of(context).textTheme.titleLarge,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //  showAwesomeDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 25), // การระบุขนาดของปุ่ม
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 5,
                        ),
                        child: Text(
                          "จอง",
                          style: GoogleFonts.inter(
                            // textStyle: Theme.of(context).textTheme.titleLarge,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void showAwesomeDialog(
      BuildContext context, DocumentSnapshot d, String collection1) {
    AwesomeDialog(
      context: context,
      title: 'ยืนยันการยืมหนังสือ',
      titleTextStyle: GoogleFonts.inter(
        // textStyle: Theme.of(context).textTheme.titleLarge,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 246, 121, 112),
      ),
      btnOkOnPress: d["status"]
          ? () {
              showAwesomeDialog3(context);
            }
          : () {
              showAwesomeDialog2(context);
              FirebaseAuthService().Update_User(d["ID"]);
              FirebaseAuthService().Update_Book(collection1, d["ID"], true);
            },
      btnOkColor: const Color.fromARGB(255, 112, 157, 114),
      btnOkText: "ยืนยัน",
      btnCancelOnPress: () {},
      btnCancelColor: const Color.fromARGB(255, 246, 121, 112),
      btnCancelText: "ยกเลิก",
    ).show();
  }

  void showAwesomeDialog2(BuildContext context) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            title: 'การยืมสำเร็จ',
            titleTextStyle: GoogleFonts.inter(
              // textStyle: Theme.of(context).textTheme.titleLarge,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            btnCancelOnPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bottomnavigationbar()),
              );
            },
            btnCancelColor: const Color.fromARGB(255, 112, 157, 114),
            btnCancelText: "กลับไปยังหน้าหลัก")
        .show();
  }

  void showAwesomeDialog3(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      title: 'การยืมล้มเหลวโปรดลองใหม่อีกครั้ง',
      titleTextStyle: GoogleFonts.inter(
        // textStyle: Theme.of(context).textTheme.titleLarge,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 246, 121, 112),
      ),
      btnCancelOnPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => bookingbookscreen()),
        );
      },
      btnCancelColor: const Color.fromARGB(255, 246, 121, 112),
      btnCancelText: "กลับไปยังหน้าหลัก",
    ).show();
  }
}
