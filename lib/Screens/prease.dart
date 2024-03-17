import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  // var a = 0;
  @override
  Widget build(BuildContext context) {
    bool a = false;
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: a
                      ? () {
                        setState(() {
                            a = true;
                            print("dew12dddd13");
                          });
                        }
                      : () {
                          setState(() {
                            a = true;
                            print("dew1213");
                          });
                        },
                  // showAwesomeDialog(context);

                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // สีพื้นหลังของปุ่ม
                    onPrimary: Colors.white, // สีของตัวอักษรภายในปุ่ม
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30), // การระบุขนาดของปุ่ม
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20)), // การปรับรูปร่างของปุ่มเป็นรูปร่างวงกลม
                    elevation: 5, // การกำหนดเงาของปุ่ม
                  ),
                  child: a
                      ? Text(
                          "จองไม่ด้ายยยย",
                          style: GoogleFonts.inter(
                            // textStyle: Theme.of(context).textTheme.titleLarge,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )//true
                      : Text( 
                          "จอง",
                          style: GoogleFonts.inter(
                            // textStyle: Theme.of(context).textTheme.titleLarge,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),//false
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void showAwesomeDialog(BuildContext context) {

  //   AwesomeDialog(
  //           context: context,
  //           title: 'Awesome Dialog',
  //           desc: 'This is an example of Awesome Dialog.',
  //           btnOkOnPress: () {
  //             if (a == 0) {
  //               a = 1;
  //               showAwesomeDialog2(context);
  //             } else
  //               showAwesomeDialog3(context);
  //           },
  //           btnCancelOnPress: () {})
  //       .show();
  // }

  // void showAwesomeDialog2(BuildContext context) {
  //   AwesomeDialog(
  //           context: context,
  //           dialogType: DialogType.success,
  //           title: 'Awesome Dialog',
  //           desc: 'This is an example of Awesome Dialog.',
  //           btnCancelOnPress: () {})
  //       .show();
  // }

  // void showAwesomeDialog3(BuildContext context) {
  //   AwesomeDialog(
  //           context: context,
  //           dialogType: DialogType.error,
  //           title: 'Awesome Dialog',
  //           desc: 'This is an example of Awesome Dialog.',
  //           btnCancelOnPress: () {})
  //       .show();
  // }
}
