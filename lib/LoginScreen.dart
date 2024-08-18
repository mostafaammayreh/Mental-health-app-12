import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/DoctorLoginScreen.dart';
import 'package:untitled/PatientLoginScreen.dart';

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PatientLoginScreen()),
//                 );
//               },
//               child: Text('Login as Patient'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => DoctorLoginScreen()),
//                 );
//               },
//               child: Text('Login as Doctor'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(120, 13, 139, 91),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "It's Ok Not To Be OKAY!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              Icon(
                Icons.favorite_border, // Heart icon for empathy
                size: 120.0,
                color: Colors.white,
              ),
              SizedBox(height: 48.0),
              Center(
                child: CustomButton(
                  icon: Icons.local_hospital, // Icon for 'Log in as Doctor'
                  title: "Log in as patient",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientLoginScreen()),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: CustomButton(
                  //chcolor: co,
                  icon: Icons.person, // Icon for 'Log in as Patient'
                  title: "Log in as Doctor",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorLoginScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onPressed;
  //final Color chcolor;
  CustomButton(
      {required this.icon, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => onPressed(),
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
