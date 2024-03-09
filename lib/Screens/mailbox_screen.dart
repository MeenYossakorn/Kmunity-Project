import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kmunity_se/constant/constant.dart';

class mailscreen extends StatelessWidget {
  mailscreen({super.key});
  var height, width;

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
            SizedBox(
              height: height * 0.13, // เลื่อน Container สีเทาอยู่สูงขึ้น
              child: Align(
                alignment: Alignment
                    .bottomCenter, // จัด Text ไว้ที่ด้านล่างของ Container
                child: Transform.translate(
                  offset: Offset(0, -30), // ลองปรับค่า offset เพื่อเลื่อนขึ้น
                  child: Text(
                    "MAILBOX",
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
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  20, 0, 20, 20), // เพิ่มความสูงด้านบนเป็น 40
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Color(0xA2000000),
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                height: height * 0.73, // ความสูงของ Container เท่าเดิม
                width: width - 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ListView.builder(
                    itemCount: 4, // จำนวนรายการที่ต้องการสร้าง
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        height: 100,
                        margin: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 114, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                                width:
                                    8), // เพิ่มช่องว่างด้านซ้ายของ Container สีส้ม
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey, // สีเท่า
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            const SizedBox(
                                width: 16), // เพิ่มช่องว่างระหว่าง Container
                            Text(
                              'Your text here',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
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
