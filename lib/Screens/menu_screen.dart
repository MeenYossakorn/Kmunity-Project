import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class menuscreen extends StatelessWidget {
  menuscreen({super.key});
  var height, width;
  List imgIcon = [
    "assets/images/book.png",
    "assets/images/meeting.png",
    "assets/images/boardgame.png",
    "assets/images/movie.png",
    "assets/images/feedback.png"
  ];
  List imgName = [
    "Booking Book",
    "Booking Room",
    "Booking Boardgame",
    "Movie",
    "Feedback"
  ];
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
            colors: [Colors.orange, Colors.white],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.18, // เลื่อน Container สีเทาอยู่สูงขึ้น
              child: Align(
                alignment: Alignment
                    .bottomCenter, // จัด Text ไว้ที่ด้านล่างของ Container
                child: Transform.translate(
                  offset: Offset(0, -20), // ลองปรับค่า offset เพื่อเลื่อนขึ้น
                  child: Text(
                    "MENU",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey, // เปลี่ยนสีเป็นเทา
                  borderRadius: BorderRadius.circular(20),
                ),
                height: height * 0.68, // ปรับความสูงของ Container สีเทา
                width: width - 40,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0,
                      20.0), // เพิ่มพื้นที่ด้านล่างของ GridView.builder
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: imgIcon.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
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
                                    color: Colors.blue, // สีของเส้นขอบ
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

