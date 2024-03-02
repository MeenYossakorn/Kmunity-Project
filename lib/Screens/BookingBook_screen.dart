import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:kmunity_se/component/my_button.dart';

class bookingbookscreen extends StatelessWidget {
  const bookingbookscreen({super.key,});
  

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
              top: 53,
              left: 50,
              right: 50,
              child: Center(
                child: Text(
                  "MENU",
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
                        color: Color.fromARGB(161, 110, 110, 110),
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                  width: 330,
                  height: 521,
                  child:Text("adasdasda")),
            ),
          ],
        ),
      ),
    );
  }
}