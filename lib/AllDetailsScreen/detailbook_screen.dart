import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kmunity_se/Screens/BookingBook_screen.dart';
import 'package:kmunity_se/Screens/bottom_nav.dart';
import "package:google_fonts/google_fonts.dart";

class detailbookscreen extends StatefulWidget {
  final String Namebook;
  final String Detailbook;
  final String image;
  final String documentID;

  detailbookscreen(this.Namebook, this.Detailbook, this.image, this.documentID);

  @override
  State<detailbookscreen> createState() => _detailbookscreenState();
}

class _detailbookscreenState extends State<detailbookscreen> {
  
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
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 10,
                                color: Color.fromARGB(161, 110, 110, 110),
                                offset: Offset(0, 0),
                              )
                            ],
                          ),
                          width: 60,
                          height: 30,
                          child: Center(
                            child: Text(
                              "จอง",
                              style: GoogleFonts.inter(
                                // textStyle: Theme.of(context).textTheme.titleLarge,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
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
}
