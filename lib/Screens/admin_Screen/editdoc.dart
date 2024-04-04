import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditDocumentPage extends StatefulWidget {
  final String documentId;

  EditDocumentPage({required this.documentId});

  @override
  _EditDocumentPageState createState() => _EditDocumentPageState();
}

class _EditDocumentPageState extends State<EditDocumentPage> {
  late TextEditingController _nameController;
  late TextEditingController _detailController;
  late TextEditingController _timeController;
  String? _imageUrl;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _detailController = TextEditingController();
    _timeController = TextEditingController();

    // Load data from Firestore
    FirebaseFirestore.instance
        .collection('infomovie')
        .doc(widget.documentId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        _nameController.text = data['name'];
        _detailController.text = data['detail'];
        _timeController.text = data['time'];
        _imageUrl = data['image_url']; // Load image URL from Firestore
      }
    });
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);

      var metadata = SettableMetadata(contentType: 'image/jpeg');
      var snapshot = await FirebaseStorage.instance
          .ref('movie/')
          .child('${DateTime.now().millisecondsSinceEpoch}')
          .putFile(
            imageFile,
            metadata,
          );
      String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _imageUrl = downloadUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: _pickImage,
              child: _imageUrl == null
                  ? Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey,
                      child: Icon(Icons.image, size: 50, color: Colors.white),
                    )
                  : Container(
                      width: 200,
                      height: 200,
                      child: Image.network(
                        _imageUrl!,
                        fit: BoxFit
                            .fitWidth, // ใช้ fitWidth เพื่อไม่ให้รูปภาพขยายเกินขอบซ้าย-ขวา
                      ),
                    ),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'name'),
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ],
            ),
            TextFormField(
              controller: _detailController,
              decoration: InputDecoration(labelText: 'detail'),
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ],
            ),
            TextFormField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'time'),
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('infomovie')
                    .doc(widget.documentId)
                    .update({
                  'name': _nameController.text,
                  'detail': _detailController.text,
                  'time': _timeController.text,
                  'image': _imageUrl,
                }).then((_) {
                  Navigator.pop(context); // Close the edit page after update
                });
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _detailController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}
