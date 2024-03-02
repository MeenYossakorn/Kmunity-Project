import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kmunity_se/component/My_IconButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http ;


class databaseuser extends StatefulWidget {
  const databaseuser({super.key});

  @override
  State<databaseuser> createState() => _databaseuserState();
}

class _databaseuserState extends State<databaseuser> {
  List product = [];
  Future<void> getrecord() async {
    String uri = "http://10.0.2.2/kmunity_se/user1.php";
    
    try {
      var response = await http.get(Uri.parse(uri));

      setState(() {
        product = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
   void initState() {
    getrecord();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(product[index]['name']),
              subtitle:Text(product[index]['email']),
            ),
          );
        }
        ),
    );
  }
}