import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';

class BookAppointmentScreen extends StatefulWidget {
  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final _patientNameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String? _selectedDoctor; // Changed to nullable

  @override
  void dispose() {
    _patientNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _bookAppointment() async {
    // Check if the selected date is a Friday
    if (_selectedDate.weekday == DateTime.friday) {
      _showErrorDialog('Booking an appointment on Friday is not allowed.');
      return;
    }

    final appointmentCollection =
        FirebaseFirestore.instance.collection('appointments');

    // Check if the appointment already exists
    final existingAppointments = await appointmentCollection
        .where('doctorName', isEqualTo: _selectedDoctor)
        .where('date',
            isEqualTo: DateFormat('yyyy-MM-dd').format(_selectedDate))
        .where('time', isEqualTo: _selectedTime.format(context))
        .get();

    if (existingAppointments.docs.isNotEmpty) {
      _showErrorDialog(
          'An appointment with the same date, time, and doctor already exists.');
      return;
    }

    final docRef = appointmentCollection.doc();

    await docRef.set({
      'patientName': _patientNameController.text,
      'doctorName': _selectedDoctor,
      'date': DateFormat('yyyy-MM-dd').format(_selectedDate),
      'time': _selectedTime.format(context),
    });

    _showSuccessDialog('Appointment booked successfully.');
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Book an Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _patientNameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Select Date'),
              subtitle: Text(DateFormat('yyyy-MM-dd').format(_selectedDate)),
              onTap: () => _selectDate(context),
            ),
            ListTile(
              title: Text('Select Time'),
              subtitle: Text(_selectedTime.format(context)),
              onTap: () => _selectTime(context),
            ),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('doctors').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                List<DropdownMenuItem<String>> doctorItems = [];
                for (var doc in snapshot.data!.docs) {
                  final Map<String, dynamic>? data =
                      doc.data() as Map<String, dynamic>?; // Get the data map
                  if (data != null && data.containsKey('name')) {
                    final doctorName = data['name'];
                    doctorItems.add(
                      DropdownMenuItem(
                        child: Text(doctorName),
                        value: doctorName,
                      ),
                    );
                  }
                }
                return DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedDoctor,
                  items: doctorItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDoctor = newValue;
                    });
                  },
                  hint: Text('Select a Doctor'),
                );
              },
            ),
            ElevatedButton(
              onPressed: _bookAppointment,
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
