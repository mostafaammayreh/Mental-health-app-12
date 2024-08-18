import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PatientProfileScreen extends StatelessWidget {
  final User
      user; //User: Represents the user, likely from Firebase Authentication.

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //FirebaseFirestore: For interacting with Firestore to fetch patient data.

  PatientProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 12, 12),
      appBar: AppBar(
        title: Text('MentalHealth App'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _firestore.collection('patients').doc(user.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Patient not found'));
          }
          //The FutureBuilder fetches the patient's data from the Firestore collection patients using the user's UID.
// It handles different states: loading, error, no data, and data available.
          var patientData = snapshot.data!.data() as Map<String, dynamic>;
          //snapshot.data!.data(): The data() method of a DocumentSnapshot returns the document’s data
          //as a Map<String, dynamic>. This map contains the fields and values stored in the Firestore document.
          //as Map<String, dynamic>: This explicitly casts the retrieved data to a Map<String, dynamic>. This is necessary because data() returns a generic Object?,
          //and casting it ensures that Dart knows the exact type of patientData

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome back, ",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                Text(
                  '${patientData['name']}',
                  style: TextStyle(color: Colors.white, fontSize: 34),
                ),
                SizedBox(height: 20),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: <Widget>[
                    _buildButton(context, 'book ', Icons.calendar_today,
                        '/bookScreen', Colors.lightBlueAccent, Colors.white),
                    _buildButton(context, 'Tests', Icons.assessment,
                        '/testsScreen', Colors.purple, Colors.white),
                    _buildButton(context, 'Meditation Zone', Icons.spa,
                        '/meditationScreen', Colors.red, Colors.white),
                    _buildButton(context, 'Read Articles', Icons.book,
                        '/articlesScreen', Colors.yellow, Colors.white),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, IconData icon,
      String route, Color backgroundColor, Color fontColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(text),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          foregroundColor: MaterialStateProperty.all<Color>(fontColor),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
      ),
    );
  }
}
