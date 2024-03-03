import 'package:flutter/material.dart';
import 'package:kmunity_se/Screens/BookingBook_screen.dart';
import 'package:kmunity_se/Screens/bottom_nav.dart';
import "package:google_fonts/google_fonts.dart";

class sciencebook extends StatelessWidget {
  const sciencebook({super.key});

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
                          width: 180,
                          height: 50,
                          child: Center(
                            child: Text(
                              "วิทยาศาสตร์",
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
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Positioned(
                            top: 243,
                            left: 50,
                            right: 50,
                            child: Container(
                              // color: Colors.blue,
                              width: 290,
                              height: 450,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, // จำนวนคอลัมน์ในแต่ละแถว
                                  childAspectRatio:
                                      2, // สัดส่วนของความสูงต่อความกว้าง
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        // color: Colors.blueGrey,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                "assets/images/booktest.png"),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              // color: Colors.amber,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      // color: Colors.cyan,
                                                      width: 100,
                                                      height: 75,
                                                      child: Text(
                                                          'fill text $index')),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Colors.orange,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 10,
                                                            color:
                                                                Color.fromARGB(
                                                                    161,
                                                                    110,
                                                                    110,
                                                                    110),
                                                            offset:
                                                                Offset(0, 0),
                                                          )
                                                        ],
                                                      ),
                                                      width: 50,
                                                      height: 25,
                                                      child: Center(
                                                        child: Text(
                                                          "จอง",
                                                          style:
                                                              GoogleFonts.inter(
                                                            // textStyle: Theme.of(context).textTheme.titleLarge,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
