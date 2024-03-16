import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:kmunity_se/Screens/bottom_nav.dart';

class bookingboardgamescreen extends StatefulWidget {
  bookingboardgamescreen({
    super.key,
  });

  @override
  State<bookingboardgamescreen> createState() => _bookingboardgamescreenState();
}

class _bookingboardgamescreenState extends State<bookingboardgamescreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _documents = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    QuerySnapshot snapshot = await _firestore.collection('boardgame').get();
    setState(() {
      _documents = snapshot.docs;
    });
  }

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
                  "Booking Boardgame",
                  style: GoogleFonts.inter(
                    // textStyle: Theme.of(context).textTheme.titleLarge,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
                    SizedBox(
                      height: 10,
                    ),
                    Positioned(
                      top: 158,
                      left: 50,
                      right: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFFF7302),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color.fromARGB(161, 110, 110, 110),
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                        width: 142,
                        height: 30,
                        child: Center(
                          child: Text(
                            "เลือกบอร์ดเกม",
                            style: GoogleFonts.inter(
                              // textStyle: Theme.of(context).textTheme.titleLarge,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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
                          width: 350,
                          height: 450,

                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, // จำนวนคอลัมน์ในแต่ละแถว
                              childAspectRatio:1, // สัดส่วนของความสูงต่อความกว้าง
                              
                            ),
                            itemCount: _documents.length,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot document = _documents[index];
                              return Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                                  child: Container(
                                 
                                    decoration: BoxDecoration(
                                      color: Color(0x0FFF7200),
                                      // color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                       
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 242,
                                              height: 70,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5.0, 0, 0, 0),
                                                child: Image.network(
                                                    document["image"]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Container(
                                                child: Text(
                                                  document["Name"],
                                                  style: GoogleFonts.inter(
                                                    // textStyle: Theme.of(context).textTheme.titleLarge,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  ),
                                                  softWrap: true,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                                // color: Colors.cyan,
                                                width: 256,
                                                height: 120,
                                                child: SingleChildScrollView(
                                                  child: Center(
                                                    child: Text(
                                                      document["info"],
                                                      style: GoogleFonts.inter(
                                                        // textStyle: Theme.of(context).textTheme.titleLarge,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                      softWrap: true,
                                                    ),
                                                  ),
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.orange,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 10,
                                                      color: Color.fromARGB(
                                                          161, 110, 110, 110),
                                                      offset: Offset(0, 0),
                                                    )
                                                  ],
                                                ),
                                                width: 50,
                                                height: 25,
                                                child: Center(
                                                  child: Text(
                                                    "จอง",
                                                    style: GoogleFonts.inter(
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
                                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
