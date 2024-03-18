// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class check extends StatefulWidget {
//   const check({super.key});

//   @override
//   State<check> createState() => _checkState();
// }

// class _checkState extends State<check> {
//   User? user = FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder(
//             stream: FirebaseFirestore.instance
//                 .collection('user')
//                 .doc(user!.uid)
//                 .collection("status_user")
//                 .doc("Status_check")
//                 .snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 var img = snapshot.data?.data()?['status'];
//                 return 
                
                
//                 }else{return}
//             }),
//       ),
//     );
//   }
// }
