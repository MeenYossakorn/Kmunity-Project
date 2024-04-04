import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback view'),
      ),
      body: FirebaseDocumentsListView(),
    );
  }
}

class FirebaseDocumentsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('feedback').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<DocumentSnapshot> documents = snapshot.data!.docs;

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            DocumentSnapshot document = documents[index];
            return ListTile(
              title: Text(document['title']),
              subtitle: Text(document['subtitle']),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteDocument(context, document.id);
                },
              ),
            );
          },
        );
      },
    );
  }

  void _deleteDocument(BuildContext context, String documentId) {
    FirebaseFirestore.instance.collection('feedback').doc(documentId).delete().then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Document deleted successfully'),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete document'),
        ),
      );
    });
  }
}