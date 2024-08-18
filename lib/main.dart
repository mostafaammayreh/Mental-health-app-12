import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/AnalyzerPage.dart';
import 'package:untitled/Assessment.dart';
import 'package:untitled/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/Medicine.dart';
import 'package:untitled/MentalIllness.dart';
import 'package:untitled/Therapy.dart';
import 'package:untitled/Yoga.dart';
import 'package:untitled/appointments.dart';
import 'package:untitled/articles.dart';
import 'package:untitled/draft.dart';
import 'package:untitled/med.dart';
import 'package:untitled/tests.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get user => null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/bookScreen': (context) => YouTubeVideoScreen(),
        '/testsScreen': (context) => tests(),
        '/meditationScreen': (context) => YouTubeVideoScreen(),

        '/disorder': (context) => Assessment(),
        '/text': (context) => AnalyzerPage(),
        '/bookScreen': (context) => BookAppointmentScreen(),
        '/articlesScreen': (context) => ArticlesApp(),
        '/mentalillness': (context) => MentalIllness(),
        '/therapy': (context) => Therapy(),
        '/medicine': (context) => Medicine(),
        '/yoga': (context) => Yoga(),

        // ... other routes
      },
      home: LoginScreen(),
    );
  }
}
