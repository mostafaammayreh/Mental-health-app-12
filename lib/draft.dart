// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class PatientProfileScreen extends StatelessWidget {
//   final User user;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   PatientProfileScreen({Key? key, required this.user}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 118, 179, 120),
//       appBar: AppBar(
//         title: Text('MentalHealth App'),
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: _firestore.collection('patients').doc(user.uid).get(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Center(child: Text('Patient not found'));
//           }

//           var patientData = snapshot.data!.data() as Map<String, dynamic>;

//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "Welcome back, ",
//                   style: TextStyle(color: Colors.white, fontSize: 50),
//                 ),
//                 Text(
//                   '${patientData['name']}',
//                   style: TextStyle(color: Colors.white, fontSize: 34),
//                 ),
//                 SizedBox(height: 20),
//                 GridView.count(
//                   crossAxisCount: 2,
//                   shrinkWrap: true,
//                   children: <Widget>[
//                     _buildButton(context, 'Book Appointments',
//                         Icons.calendar_today, '/bookScreen'),
//                     _buildButton(
//                         context, 'Tests', Icons.assessment, '/testsScreen'),
//                     _buildButton(context, 'Meditation Zone', Icons.spa,
//                         '/meditationScreen'),
//                     _buildButton(context, 'Read Articles', Icons.book,
//                         '/articlesScreen'),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildButton(
//       BuildContext context, String text, IconData icon, String route) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ElevatedButton.icon(
//         icon: Icon(icon),
//         label: Text(text),
//         onPressed: () {
//           Navigator.pushNamed(context, route);
//         },
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
//           foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//           textStyle: MaterialStateProperty.all<TextStyle>(
//             TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//             EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//           ),
//         ),
//       ),
//     );
//   }
// }
