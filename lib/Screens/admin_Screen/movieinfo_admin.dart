import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kmunity_se/Screens/admin_Screen/editdoc.dart';

class editmovie extends StatefulWidget {
  @override
  _editmovieState createState() => _editmovieState();
}

class _editmovieState extends State<editmovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('infomovie List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('infomovie').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var document = documents[index];
              return ListTile(
                leading: Image.network(
                  document[
                      'image'], // เปลี่ยน 'image_url' เป็นชื่อฟิลด์ของเอกสารที่เก็บ URL รูปภาพ
                  width: 100, // ปรับขนาดรูปภาพตามต้องการ
                  height: 100,
                ),
                title: Text(document['name']),
                subtitle: Text(document['detail']),
                trailing: Text(
                  document['time'], // เพิ่มข้อความเพิ่มเติมที่ต้องการแสดง
                  style: TextStyle(fontSize: 16.0),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditDocumentPage(documentId: document.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
