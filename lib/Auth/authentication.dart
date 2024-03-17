import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class FirebaseAuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Getter for current user

  User? get currentUser => _auth.currentUser;

  // Stream for auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user; // Return the signed-in user
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth exceptions
      handleFirebaseAuthError(e);
      return null;
    } catch (e) {
      // Handle other exceptions
      print("An unexpected error occurred: $e");
      return null;
    }
  }

  void handleFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case "weak-password":
        print("The password is too weak.");
        break;
      case "email-already-in-use":
        print("The email address is already in use by another user.");
        break;
      case "invalid-email":
        print("The email address is invalid.");
        break;
      case "user-not-found":
        print("The user account does not exist.");
        break;
      case "wrong-password":
        print("The password is incorrect.");
        break;
      default:
        print("An unknown error occurred: ${e.code}");
    }
  }

  Future<bool> Update_User(
    String ID_book,
  ) async {
    try {
      DateTime data = new DateTime.now();
      await _firestore
          .collection('user')
          .doc(_auth.currentUser!.uid)
          .collection('status_user')
          .doc('Status_check')
          .update({
        'time': '${data.day}:${data.hour}:${data.minute}',
        'ID_book': ID_book,
        'status': true,
      });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<bool> Update_Book(String collec, String book_id, bool status) async {
    try {
      await _firestore.collection(collec).doc(book_id).update({
        'status': status,
      });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }
}
