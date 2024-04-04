import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _detailController = TextEditingController();
    _timeController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _detailController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  // Your image pick logic
                },
                child: _imageUrl == null
                    ? Container(
                        width: 200,
                        height: 200,
                        color: Colors.grey,
                        child: Icon(Icons.image, size: 50, color: Colors.white),
                      )
                    : Image.network(_imageUrl!), // Display network image
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
                  // Your update logic
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}