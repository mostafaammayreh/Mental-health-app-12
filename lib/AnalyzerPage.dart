import 'package:flutter/material.dart';
import 'dart:convert';

class AnalyzerPage extends StatefulWidget {
  @override
  _AnalyzerPageState createState() => _AnalyzerPageState();
}

class _AnalyzerPageState extends State<AnalyzerPage> {
  TextEditingController _textController = TextEditingController();
  String _symptoms = 'No symptoms';

  void analyzeText() {
    String text = _textController.text.toLowerCase();
    String symp = '';

    if (text.contains('insomnia') ||
        text.contains('can\'t sleep') ||
        text.contains('cant sleep') ||
        text.contains('can not sleep') ||
        text.contains('Difficulty falling asleep') ||
        text.contains('Trouble staying asleep') ||
        text.contains('Waking up too early') ||
        text.contains('stay awake')) {
      symp += ' Insomnia   ';
    }

    if (text.contains('eating all the time') ||
        text.contains('overweight') ||
        text.contains('more than one meal') ||
        text.contains('binge') ||
        text.contains('fair of gaining weight') ||
        text.contains('cant stop eating')) {
      symp += ' Eating Disorder ';
    }

    if (text.contains('mood') ||
        text.contains('rapid changes') ||
        text.contains('unpredictable emotions') ||
        text.contains('roller coaster') ||
        text.contains('violint behavior') ||
        text.contains('crying')) {
      symp += '  mood swings  ';
    }

    if (text.contains('Overwhelmed') ||
        text.contains('Anxiety') ||
        text.contains('Pressure') ||
        text.contains('Strain') ||
        text.contains('worry') ||
        text.contains('stress') ||
        text.contains('crying')) {
      symp += '  stress ';
    }

    if (text.contains('hopeless') ||
        text.contains('trapped') ||
        text.contains('burden') ||
        text.contains('no reason to live') ||
        text.contains('alone') ||
        text.contains('want to die') ||
        text.contains('end it')) {
      symp += '  suicide thoughts  ';
    }
    setState(() {
      _symptoms = symp.isNotEmpty ? symp : 'No symptoms';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptom Analyzer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter your thoughts here...',
              ),
              maxLines: null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: analyzeText,
              child: Text('Analyze'),
            ),
            SizedBox(height: 20),
            Text(
              _symptoms,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
