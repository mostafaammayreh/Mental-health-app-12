import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoctorProfileScreen extends StatefulWidget {
  final User user;

  DoctorProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Widget> appointmentWidgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 146, 49),
      appBar: AppBar(
        title: Text('Doctor Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome DR.',
              style: TextStyle(
                  color: Color.fromARGB(223, 0, 27, 100), fontSize: 50),
            ),
            FutureBuilder<DocumentSnapshot>(
              future:
                  _firestore.collection('doctors').doc(widget.user.uid).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Text('Doctor not found');
                }

                var doctorData = snapshot.data!.data() as Map<String, dynamic>;

                return Text(
                  '${doctorData['name']}',
                  style: TextStyle(
                      color: Color.fromARGB(255, 48, 78, 177), fontSize: 40),
                );
              },
            ),
            SizedBox(
              height: 100,
              width: 100,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.view_agenda, size: 30),
              label: Text(
                'View Appointments',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onPressed: () async {
                String doctorName = '';
                await _firestore
                    .collection('doctors')
                    .doc(widget.user.uid)
                    .get()
                    .then((value) =>
                        doctorName = value.data()!['name'].toString());

                QuerySnapshot appointmentSnapshot = await _firestore
                    .collection('appointments')
                    .where('doctorName', isEqualTo: doctorName)
                    .get();

                setState(() {
                  appointmentWidgets = appointmentSnapshot.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['patientName']),
                      subtitle: Text('${data['date']} at ${data['time']}'),
                    );
                  }).toList();
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: appointmentWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
